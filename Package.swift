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
  ],
  targets: [
    .target(name: "HTTPClient"),
    .target(
      name: "Library1",
      dependencies: [
        .target(name: "HTTPClient")
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
