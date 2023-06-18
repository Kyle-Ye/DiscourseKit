// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DiscourseKit",
    platforms: [.iOS(.v16), .macOS(.v13), .watchOS(.v9)],
    products: [
        .library(name: "DiscourseKit", targets: ["DiscourseKit"]),
        .library(name: "DiscourseModel", targets: ["DiscourseModel"]),
    ],
    dependencies: [
        .package(url: "https://github.com/WeTransfer/Mocker.git", from: "2.3.0"),
        .package(url: "https://github.com/Kyle-Ye/swift-openapi-generator.git", branch: "openapi_31x"),
//        .package(url: "https://github.com/apple/swift-openapi-generator.git", from: "0.1.0"),
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: "0.1.3"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession.git", from: "0.1.1"),
    ],
    targets: [
        .target(
            name: "DiscourseModel",
            plugins: [
                .plugin(
                    name: "OpenAPIGenerator",
                    package: "swift-openapi-generator"
                ),
            ]
        ),
        .target(
            name: "DiscourseClient",
            dependencies: [
                "DiscourseModel",
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
        .testTarget(
            name: "DiscourseClientTests",
            dependencies: [
                "DiscourseClient",
                .product(name: "Mocker", package: "Mocker"),
            ],
            resources: [.copy("Resources")]
        ),
//        .testTarget(
//            name: "DiscourseModelTests",
//            dependencies: ["DiscourseModel"]
//        ),
    ]
)
