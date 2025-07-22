package com.jentis.flutter

import okhttp3.Interceptor
import okhttp3.Response
import okhttp3.Request

class DebugInterceptor(private val onRequest: (Request) -> Unit) : Interceptor {
    override fun intercept(chain: Interceptor.Chain): Response {
        val request = chain.request()
        onRequest(request)
        return chain.proceed(request)
    }
}