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
            url: "https://github.com/placidapp/placid-ios/releases/download/1.0.1/Placid.xcframework.zip",
            checksum: "c8d7f23934e95de11e97228d846b57e4d370d3cde37385f7de0db27b1ed1b8da"
        )
    ]
)
