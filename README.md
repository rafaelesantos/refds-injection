# Refds Injection

[![Swift](https://github.com/rafaelesantos/refds-injection/actions/workflows/swift.yml/badge.svg?branch=main)](https://github.com/rafaelesantos/refds-injection/actions/workflows/swift.yml)

`RefdsInjection` is a Swift library that provides a simple yet powerful solution for dependency injection in your iOS, macOS, and other Swift applications. 
With `RefdsInjection`, you can manage your components' dependencies cleanly and efficiently, easing the development, testing, and maintenance of your codebase.

## Installation

Add this project to your `Package.swift` file.

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/rafaelesantos/refds-injection.git", branch: "main")
    ],
    targets: [
        .target(
            name: "YourProject",
            dependencies: [
                .product(
                    name: "RefdsInjection",
                    package: "refds-injection"),
            ]),
    ]
)
```
