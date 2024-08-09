// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Library1",
    products: [
        .library(
            name: "Library1",
            targets: ["Library1"]
        ),
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
            dependencies: ["Library1"]
        ),
    ]
)
