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
            url: "https://github.com/placidapp/placid-ios/releases/download/0.0.9/Placid.xcframework.zip",
            checksum: "97b586d92baaf2b6313cc7c77596a1c7ca89d2eb89aeea65d9c7798f5c0e8932"
        )
    ]
)
