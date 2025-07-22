import Flutter
import Foundation
import JentisSDK
import UIKit

public class JentisFlutterPlugin: NSObject, FlutterPlugin, JentisApi,
  FlutterStreamHandler
{
  private var eventSink: FlutterEventSink?

  @objc public func onListen(
    withArguments arguments: Any?,
    eventSink events: @escaping FlutterEventSink
  ) -> FlutterError? {
    eventSink = events
    DebugURLProtocol.eventSink = eventSink
    URLProtocol.registerClass(DebugURLProtocol.self)
    return nil
  }

  @objc public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    eventSink = nil
    DebugURLProtocol.eventSink = nil
    return nil
  }

  func initialize(config: TrackConfig) throws {
    let environment: JentisSDK.TrackConfig.Environment
    switch config.environment {
    case .live:
      environment = .live
    case .stage:
      environment = .stage
    }

    let protocolString = config.customProtocol.map { proto in
      switch proto {
      case .http: return "http"
      case .https: return "https"
      }
    }

    let config = JentisSDK.TrackConfig(
      trackDomain: config.trackDomain,
      container: config.container,
      environment: environment,
      version: config.version,
      debugCode: config.debugCode,
      sessionTimeoutInSeconds: config.sessionTimeoutInSeconds != nil
        ? Double(config.sessionTimeoutInSeconds!) : nil,
      authorizationToken: config.authorizationToken,
      customProtocol: protocolString,
      enableOfflineTracking: config.enableOfflineTracking
    )

    JentisService.configure(with: config)
  }
  
  // Update configuration for JentisTrackService
  func restartConfig(config: TrackConfig) throws {
    let environment: JentisSDK.TrackConfig.Environment
    switch config.environment {
    case .live:
      environment = .live
    case .stage:
      environment = .stage
    }

    let protocolString = config.customProtocol.map { proto in
      switch proto {
      case .http: return "http"
      case .https: return "https"
      }
    }

    let config = JentisSDK.TrackConfig(
      trackDomain: config.trackDomain,
      container: config.container,
      environment: environment,
      version: config.version,
      debugCode: config.debugCode,
      sessionTimeoutInSeconds: config.sessionTimeoutInSeconds != nil
        ? Double(config.sessionTimeoutInSeconds!) : nil,
      authorizationToken: config.authorizationToken,
      customProtocol: protocolString,
      enableOfflineTracking: config.enableOfflineTracking
    )

    JentisService.restartConfig(config: <#T##TrackConfig#>)
  }

  func setConsents(
    consents: [String: ConsentValue],
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    let vendorConsents = consents.mapValues { value -> ConsentStatus in
      switch value {
      case .allow: return .allow
      case .deny: return .deny
      case .ncm: return .ncm
      }
    }

    Task {
      do {
        try await TrackingService.shared.setConsents(vendorConsents)
        completion(.success(()))
      } catch {
        completion(.failure(error))
      }
    }
  }

  func push(events: [JentisEvent]) throws {
    let eventData = events.map { event -> [String: Any] in
      var dict = [String: Any]()

      if let intAttributes = event.intAttributes {
        dict.merge(intAttributes) { $1 }
      }

      if let boolAttributes = event.boolAttributes {
        dict.merge(boolAttributes) { $1 }
      }

      if let doubleAttributes = event.doubleAttributes {
        dict.merge(doubleAttributes) { $1 }
      }

      if let stringAttributes = event.stringAttributes {
        dict.merge(stringAttributes) { $1 }
      }

      return dict
    }

    for event in eventData {
      try TrackingService.shared.push(event)
    }
  }

  func submit(
    customInitiator: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    Task {
      do {
        try await TrackingService.shared.submit(customInitiator)
        completion(.success(()))
      } catch {
        completion(.failure(error))
      }
    }
  }

  func addEnrichment(enrichment: Enrichment) throws {
    try TrackingService.shared.addEnrichment(
      pluginId: enrichment.pluginId,
      arguments: (enrichment.arguments ?? [:]).compactMapValues {
        $0 as? CodableValue
      },
      variables: enrichment.variables ?? []
    )
  }

  func addCustomEnrichment(enrichment: Enrichment) throws {
    try TrackingService.shared.addCustomEnrichment(
      pluginId: enrichment.pluginId,
      arguments: (enrichment.arguments ?? [:]).compactMapValues {
        $0 as? CodableValue
      },
      variables: enrichment.variables ?? []
    )
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = JentisFlutterPlugin()

    JentisApiSetup.setUp(
      binaryMessenger: registrar.messenger(),
      api: instance,
      messageChannelSuffix: ""
    )

    let eventChannel = FlutterEventChannel(
      name: "debug_requests",
      binaryMessenger: registrar.messenger()
    )
    eventChannel.setStreamHandler(instance)
  }
}

class DebugURLProtocol: URLProtocol {
  static var eventSink: FlutterEventSink?

  override class func canInit(with request: URLRequest) -> Bool {
    // Intercept all requests
    return true
  }

  override class func canonicalRequest(for request: URLRequest) -> URLRequest {
    return request
  }

  override func startLoading() {
    let url = request.url?.absoluteString ?? ""
    var bodyString = ""
    if let body = request.httpBody {
      bodyString = String(data: body, encoding: .utf8) ?? ""
    } else if let stream = request.httpBodyStream {
      stream.open()
      let bufferSize = 1024
      var buffer = [UInt8](repeating: 0, count: bufferSize)
      var data = Data()
      while stream.hasBytesAvailable {
        let read = stream.read(&buffer, maxLength: bufferSize)
        if read > 0 {
          data.append(buffer, count: read)
        } else {
          break
        }
      }
      stream.close()
      bodyString = String(data: data, encoding: .utf8) ?? ""
    }

    let debugInfo: [String: Any] = [
      "url": url,
      "body": bodyString,
    ]
    DispatchQueue.main.async {
      DebugURLProtocol.eventSink?(debugInfo)
    }

    // Forward the request to the network
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: request) { data, response, error in
      if let response = response {
        self.client?.urlProtocol(
          self,
          didReceive: response,
          cacheStoragePolicy: .notAllowed
        )
      }
      if let data = data {
        self.client?.urlProtocol(self, didLoad: data)
      }
      if let error = error {
        self.client?.urlProtocol(self, didFailWithError: error)
      }
      self.client?.urlProtocolDidFinishLoading(self)
    }
    task.resume()
  }

  override func stopLoading() {}
}
