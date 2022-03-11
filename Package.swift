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
            url: "https://github.com/placidapp/placid-ios/releases/download/1.0.0/Placid.xcframework.zip",
            checksum: "ec1ceaaee36184831978472060b6ebd32f37f93f82498f65d1238c08c09db1f5"
        )
    ]
)
