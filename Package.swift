// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DiscourseKit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "DiscourseKit", targets: ["DiscourseKit"]),
        .library(name: "DiscourseModel", targets: ["DiscourseModel"]),
        .library(name: "OpenDiscourseKit", targets: ["OpenDiscourseKit"]),
    ],
    dependencies: [
        // Legacy DiscourseKit dependency
        .package(url: "https://github.com/binarybirds/swift-http", from: "1.0.0"),
        // OpenDiscourseKit dependency
        .package(url: "https://github.com/apple/swift-openapi-generator.git", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession.git", from: "1.0.0"),
        // Test target dependency
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
            name: "OpenDiscourseKit",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
            ],
            plugins: [
                .plugin(
                    name: "OpenAPIGenerator",
                    package: "swift-openapi-generator"
                ),
            ]
        ),
        .target(
            name: "DiscourseKit",
            dependencies: [
                "DiscourseClient",
                "DiscourseModel",
            ]
        ),
        .target(
            name: "BundleResource",
            path: "Tests/BundleResource",
            resources: [.copy("Resources")]
        ),
        .testTarget(
            name: "OpenDiscourseKitTests",
            dependencies: [
                "OpenDiscourseKit",
                "BundleResource",
                .product(name: "Mocker", package: "Mocker"),
            ]
        ),
        .testTarget(
            name: "DiscourseClientTests",
            dependencies: [
                "DiscourseClient",
                "BundleResource",
                .product(name: "Mocker", package: "Mocker"),
            ]
        ),
        .testTarget(
            name: "DiscourseModelTests",
            dependencies: ["DiscourseModel"],
            resources: [.copy("Resources")]
        ),
    ]
)
