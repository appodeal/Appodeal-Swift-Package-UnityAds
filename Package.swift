// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealUnityAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealUnityAdapter",
            targets: ["AppodealUnityAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/Unity-Technologies/Unity-Ads-Swift-Package", exact: "4.17.0"),
    ],
    targets: [
        .target(
            name: "AppodealUnityAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "UnityAds", package: "Unity-Ads-Swift-Package"),
                .target(name: "AppodealUnityAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealUnityAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealUnityAdapter/4.17.0.0/AppodealUnityAdapter.xcframework.zip",
            checksum: "e9f0ad9c0cfa6fb416df6d2db676b1430515d96b9bff561bba80f94e63ee2af9"
        ),

    ]
)
