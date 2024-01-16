// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftHELib",
    products: [
        .library(
            name: "SwiftHELib",
            targets: ["ObjCHELib", "SwiftHELib"]
        ),
    ],
    targets: [
        .target(
            name: "ObjCHELib",
            path: "Sources/ObjC",
            cxxSettings: [
                .headerSearchPath("../C++/helib_pack"),
                .headerSearchPath("../C++/helib_pack/include"),
                .unsafeFlags(["--std=c++17"])
            ],
            linkerSettings: [
                .linkedLibrary("helib"),
                .unsafeFlags(["-L../C++/helib_pack/lib"]),
            ]
        ),
        .target(
            name: "SwiftHELib",
            dependencies: ["ObjCHELib"],
            path: "Sources/SwiftHELib_1.1"
        ),
    ]
)
