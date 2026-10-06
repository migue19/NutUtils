// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "NutUtils",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "NutUtils",
            targets: ["NutUtils"]
        )
    ],
    targets: [
        .target(
            name: "NutUtils",
            path: "NutUtils/Classes"
        ),
        .testTarget(
            name: "NutUtilsTests",
            dependencies: ["NutUtils"],
            path: "NutUtilsTests",
            exclude: ["Info.plist"]
        )
    ]
)
