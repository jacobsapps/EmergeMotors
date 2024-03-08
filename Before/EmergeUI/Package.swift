// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EmergeUI",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "EmergeUI",
            targets: ["EmergeUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios.git", .upToNextMajor(from: "4.4.1")),
    ],
    targets: [
        .target(
            name: "EmergeUI",
            dependencies: [.product(name: "Lottie", package: "lottie-ios")],
            resources: [.process("Resources")]),
        .testTarget(
            name: "EmergeUITests",
            dependencies: ["EmergeUI"]),
    ]
)
