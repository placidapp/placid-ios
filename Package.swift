// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "Placid",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Placid",
            targets: ["Placid"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .binaryTarget(
            name: "Placid",
            url: "https://github.com/placidapp/placid-ios/releases/download/0.1.1/Placid.xcframework.zip",
            checksum: "d84be8d34fcdf06d73dcb073ba46244b8d9de498beb7251a3bdb0b515d5ea327"
        )
    ]
)
