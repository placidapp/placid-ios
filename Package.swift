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
            url: "https://github.com/placidapp/placid-ios/releases/download/0.1.0/Placid.xcframework.zip",
            checksum: "ba352676f20e11ccd804c5be942916ae6c6435327810542315ff818ab8e688c6"
        )
    ]
)
