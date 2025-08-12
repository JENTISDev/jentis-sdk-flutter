package com.jentis.flutter

import ConsentValue
import JentisApi
import Enrichment
import JentisEvent
import TrackConfig
import android.app.Application
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import com.jentis.sdk.jentissdk.JentisTrackService
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import okhttp3.OkHttpClient
import okio.Buffer

/** JentisFlutterPlugin */
class JentisFlutterPlugin : FlutterPlugin, JentisApi, ActivityAware {
    private var context: Context? = null
    private var application: Application? = null
    private var eventSink: EventChannel.EventSink? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        JentisApi.setUp(flutterPluginBinding.binaryMessenger, this)

        EventChannel(
            flutterPluginBinding.binaryMessenger, "debug_requests"
        ).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(
                arguments: Any?, events: EventChannel.EventSink?
            ) {
                eventSink = events
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
            }
        })
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = null
        JentisApi.setUp(binding.binaryMessenger, null)
    }

    // Update configuration for JentisTrackService
    override fun restartConfig(config: TrackConfig) {
        JentisTrackService.getInstance().restartConfig(
            trackDomain = config.trackDomain,
            container = config.container,
            environment = config.environment.name,
            version = config.version,
            debugCode = config.debugCode,
            authToken = config.authorizationToken,
            sessionTimeoutParam = config.sessionTimeoutInSeconds?.toInt(),
            protocol = config.customProtocol?.let { it.toString().lowercase() + "://" },
            enableOfflineTracking = config.enableOfflineTracking,
        )
    }

    override fun initialize(config: TrackConfig) {
        context ?: throw IllegalStateException(
            "Context is not initialized. Make sure to call onAttachedToEngine first."
        )
        application ?: throw IllegalStateException(
            "Application is not initialized. Make sure to set the application in onAttachedToActivity."
        )

        fun getRequestBodyAsString(request: okhttp3.Request): String? {
            val body = request.body ?: return null
            return try {
                val buffer = Buffer()
                body.writeTo(buffer)
                buffer.readUtf8()
            } catch (e: Exception) {
                Log.e(TAG, "The request body could not be read", e)
                null
            }
        }

        val okHttpClient = OkHttpClient.Builder().addInterceptor(
            DebugInterceptor { request ->
                // Send request info to Dart
                Handler(Looper.getMainLooper()).post {
                    eventSink?.success(
                        mapOf(
                            "url" to request.url.toString(),
                            "body" to getRequestBodyAsString(request)
                        )
                    )
                }
            }).build()

        // Initialize tracking service
        JentisTrackService.initialize(context!!, okHttpClient).apply {
            initTracking(
                application = application!!,
                trackDomain = config.trackDomain,
                container = config.container,
                environment = config.environment.name.lowercase(),
                version = config.version,
                debugCode = config.debugCode,
                authToken = config.authorizationToken,
                sessionTimeoutParam = config.sessionTimeoutInSeconds?.toInt(),
                protocol = config.customProtocol?.let { it.toString().lowercase() + "://" },
                enableOfflineTracking = config.enableOfflineTracking,
                offlineTimeout = config.offlineTimeout,
            )
        }
    }

    override fun setConsents(
        consents: Map<String, ConsentValue>, callback: (Result<Unit>) -> Unit
    ) {
        try {
            val vendorConsents = consents.mapValues { entry ->
                when (entry.value) {
                    ConsentValue.ALLOW -> true
                    ConsentValue.DENY -> false
                    ConsentValue.NCM -> "ncm"
                }
            }

            JentisTrackService.getInstance().setConsents(vendorConsents = vendorConsents)
            callback(Result.success(Unit))
        } catch (e: Exception) {
            callback(Result.failure(e))
        }
    }

    override fun push(events: List<JentisEvent>) {
        val eventData = events.map { event ->
            LinkedHashMap<String, Any>().apply {
                event.intAttributes?.let { putAll(it) }
                event.boolAttributes?.let { putAll(it) }
                event.doubleAttributes?.let { putAll(it) }
                event.stringAttributes?.let { putAll(it) }
            }
        }

        JentisTrackService.getInstance().push(eventData)
    }

    override fun submit(customInitiator: String, callback: (Result<Unit>) -> Unit) {
        try {
            JentisTrackService.getInstance().submit(customInitiator)
            callback(Result.success(Unit))
        } catch (e: Exception) {
            callback(Result.failure(e))
        }
    }

    override fun addEnrichment(enrichment: Enrichment) {
        val enrichmentMap =
            mapOf(
                "plugin" to mapOf("pluginId" to enrichment.pluginId), "enrichment" to mapOf(
                    "variablesEnrichment" to (enrichment.variables ?: emptyList())
                ), "args" to (enrichment.arguments?.filterValues { it != null }?.mapValues {
                    it.value as Any
                } ?: emptyMap()))

        JentisTrackService.getInstance().addEnrichment(enrichmentMap)
    }

    override fun addCustomEnrichment(enrichment: Enrichment) {
        val enrichmentMap =
            mapOf(
                "plugin" to mapOf("pluginId" to enrichment.pluginId), "enrichment" to mapOf(
                    "variablesEnrichment" to (enrichment.variables ?: emptyList())
                ), "args" to (enrichment.arguments?.filterValues { it != null }?.mapValues {
                    it.value as Any
                } ?: emptyMap()))

        JentisTrackService.getInstance().addCustomEnrichment(enrichmentMap)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        application = binding.activity.application
    }

    override fun onDetachedFromActivityForConfigChanges() {
        application = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        application = binding.activity.application
    }

    override fun onDetachedFromActivity() {
        application = null
    }

    companion object {
        private const val TAG = "JentisFlutterPlugin"
    }
}
