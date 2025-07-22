// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "jentis_flutter",
  platforms: [
    .iOS("15.0")
  ],
  products: [
    // If the plugin name contains "_", replace with "-" for the library name.
    .library(name: "jentis-flutter", targets: ["jentis_flutter"])
  ],
  dependencies: [
    .package(url: "https://github.com/JENTISDev/jentis-sdk-ios-releases.git", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "jentis_flutter",
      dependencies: [
        .product(name: "JentisSDK", package: "jentis-sdk-ios-releases")
      ],
      resources: [
        .process("PrivacyInfo.xcprivacy")

        // If you have other resources that need to be bundled with your plugin, refer to
        // the following instructions to add them:
        // https://developer.apple.com/documentation/xcode/bundling-resources-with-a-swift-package
      ]
    )
  ]
)
