// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Moya",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(name: "Moya", targets: ["Moya"]),
        .library(name: "ReactiveMoya", targets: ["ReactiveMoya"]),
        .library(name: "RxMoya", type: .dynamic, targets: ["RxMoya"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .exact("5.0.0-rc.1")),
        .package(url: "https://github.com/ReactiveCocoa/ReactiveSwift.git", from: ("6.0.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .branch("5.1.0-spm-dynamic")),
        .package(url: "https://github.com/Quick/Quick.git", from: "1.1.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "7.0.1"),
//        .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", .branch("feature/spm-support")),
    ],
    targets: [
         .target(
            name: "Moya",
            dependencies: [
                "Alamofire"
            ]
        ),
        .target(
            name: "ReactiveMoya",
            dependencies: [
                "Moya",
                "ReactiveSwift"
            ]
        ),
        .target(
            name: "RxMoya",
            dependencies: [
                "Moya",
                "RxSwift"
            ]
        ),
        .testTarget(
            name: "MoyaTests",
            dependencies: [
                "Moya",
                "RxMoya",
                "ReactiveMoya",
                "Quick",
                "Nimble",
//                "OHHTTPStubsSwift"
            ]
        )
    ]
)
