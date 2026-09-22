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
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/Unity-Technologies/Unity-Ads-Swift-Package", exact: "4.20.0"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealUnityAdapter/4.20.0.0/a48f86419a9f/AppodealUnityAdapter.xcframework.zip",
            checksum: "a48f86419a9fbc8185886baa2ffa5a2b5fd3a9d46085d18eacd94695bfc560a4"
        ),

    ]
)
