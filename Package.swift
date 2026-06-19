// swift-tools-version: 5.9
//
// SKILL-IOS (P7 #292) — SPM root manifest.
// Pinned to swift-tools-version 5.9 to match Xcode 16 RC baseline
// from configs/platforms/ios-arm64.yaml.

import PackageDescription

let package = Package(
    name: "MapAR",
    defaultLocalization: "en",
    platforms: [
        // Pinned to ios-arm64.yaml min_os_version. Bumping below 16
        // breaks the StoreKit 2 baseline P7 depends on.
        .iOS("16.0"),
        // Host (macOS) builds this module for `swift test`. Without a macOS
        // floor SwiftPM defaults to 10.13, where the @Observable macro
        // (Observation, macOS 14+) and os.Logger interpolation (11+) are
        // unavailable. Pin to 14 to cover both.
        .macOS(.v14),
    ],
    products: [
        .library(name: "MapARFeature", targets: ["FeatureModule"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FeatureModule",
            path: "Modules/Feature/Sources",
            swiftSettings: [
                // Strict concurrency from day one; matches the
                // ios-swift role anti-pattern guard rails.
                .enableExperimentalFeature("StrictConcurrency=complete"),
                .unsafeFlags(["-warnings-as-errors"], .when(configuration: .release)),
            ]
        ),
        .testTarget(
            name: "FeatureModuleTests",
            dependencies: ["FeatureModule"],
            path: "Modules/Feature/Tests"
        ),
    ]
)
