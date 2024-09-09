// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppModules",
    platforms: [.macOS(.v14), .iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AppModules",
            targets: ["AppModules"]),
        .library(
            name: "Login",
            targets: [ "LoginFeature" ]
        ),
        .library(
            name: "Home",
            targets: [ "HomeFeature" ]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AppModules"),
        .testTarget(
            name: "AppModulesTests",
            dependencies: ["AppModules"]
        ),
        .target(name: "LoginFeature"),
        .testTarget(
            name: "LoginFeatureTests",
            dependencies: [ "LoginFeature" ]
        ),
        .target(name: "HomeFeature"),
        .testTarget(
            name: "HomeFeatureTests",
            dependencies: [ "HomeFeature" ]
        ),
    ]
)
