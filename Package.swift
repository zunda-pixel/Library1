// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "Library1",
  platforms: [
    .macOS(.v10_15)
  ],
  products: [
    .library(
      name: "Library1",
      targets: ["Library1"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-testing", from: "0.11.0"),
    .package(url: "https://github.com/zunda-pixel/http-client", from: "0.1.2"),
  ],
  targets: [
    .target(
      name: "Library1",
      dependencies: [
        .product(name: "HTTPClient", package: "http-client"),
      ]
    ),
    .testTarget(
      name: "Library1Tests",
      dependencies: [
        .target(name: "Library1"),
        .product(name: "Testing", package: "swift-testing"),
      ]
    ),
  ]
)
