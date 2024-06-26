// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RefdsInjection",
    defaultLocalization: "pt",
    platforms: [
        .iOS(.v17),
        .macCatalyst(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .watchOS(.v10),
        .visionOS(.v1),
        .driverKit(.v23)
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
