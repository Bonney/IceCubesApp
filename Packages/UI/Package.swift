// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UI",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "UI",
            targets: ["UI"]),
    ],
    dependencies: [
        .package(name: "Network", path: "../Network"),
    ],
    targets: [
        .target(
            name: "UI",
            dependencies: [
                .product(name: "Network", package: "Network")
            ]),
        .testTarget(
            name: "UITests",
            dependencies: ["UI"]),
    ]
)
