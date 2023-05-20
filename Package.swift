// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DiscourseKit",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(name: "DiscourseKit", targets: ["DiscourseKit"]),
        .library(name: "DiscourseModel", targets: ["DiscourseModel"]),
    ],
    dependencies: [
        .package(url: "https://github.com/binarybirds/swift-http", from: "1.0.0"),
        .package(url: "https://github.com/WeTransfer/Mocker.git", from: "2.3.0"),
    ],
    targets: [
        .target(name: "DiscourseModel"),
        .target(
            name: "DiscourseClient",
            dependencies: [
                "DiscourseModel",
                .product(name: "SwiftHttp", package: "swift-http"),
            ]
        ),
        .target(
            name: "DiscourseKit",
            dependencies: [
                "DiscourseClient",
                "DiscourseModel",
            ]
        ),
        .testTarget(
            name: "DiscourseClientTests",
            dependencies: [
                "DiscourseClient",
                .product(name: "Mocker", package: "Mocker"),
            ],
            resources: [.process("Resources")]
        ),
    ]
)
