// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPM",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]
        ),
        .library(
            name: "Presentation",
            targets: ["Presentation"]
        ),
        .library(
            name: "Data",
            targets: ["Data"]
        ),
        .library(
            name: "Network",
            targets: ["Network"]
        ),
        .library(
            name: "Core",
            targets: ["Core"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: [
                "Domain"
            ]
        ),
        .target(
            name: "Data",
            dependencies: [
                "Domain"
            ]
        ),
        .target(
            name: "Domain",
            dependencies: [
                "Network"
            ]
        ),
        .target(
            name: "Network",
            dependencies: [
                "Core"
            ]
        ),
        .target(
            name: "Core",
            dependencies: [
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxRelay", package: "RxSwift"),
            ]
        )
    ]
)
