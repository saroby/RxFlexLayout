// swift-tools-version: 5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxFlexLayout",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "RxFlexLayout", targets: ["RxFlexLayout"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", branch: "6.6.0"),
        .package(url: "https://github.com/onevcat/Kingfisher", branch: "master"),
        .package(url: "https://github.com/layoutBox/FlexLayout", branch: "master"),
    ],
    targets: [
        .target(
            name: "RxFlexLayout",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                "FlexLayout",
                "Kingfisher",
            ],
            cSettings: [.define("FLEXLAYOUT_SWIFT_PACKAGE"),],
            cxxSettings: [.define("FLEXLAYOUT_SWIFT_PACKAGE"),],
            swiftSettings: [.define("FLEXLAYOUT_SWIFT_PACKAGE"),]
        ),
        .testTarget(
            name: "RxFlexLayoutTests",
            dependencies: ["RxFlexLayout",],
            cSettings: [.define("FLEXLAYOUT_SWIFT_PACKAGE"),],
            cxxSettings: [.define("FLEXLAYOUT_SWIFT_PACKAGE"),],
            swiftSettings: [.define("FLEXLAYOUT_SWIFT_PACKAGE"),]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
