// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RefdsInjection",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .macCatalyst(.v15),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "RefdsInjection",
            targets: ["RefdsInjection"]),
    ],
    targets: [
        .target(
            name: "RefdsInjection"),
        .testTarget(
            name: "RefdsInjectionTests",
            dependencies: ["RefdsInjection"]),
    ]
)
