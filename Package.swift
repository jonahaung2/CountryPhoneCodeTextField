// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CountryPhoneCodeTextField",
    platforms: [
        .iOS("17.0"), .macOS("14.0"), .tvOS(.v12)
    ],
    products: [
        .library(
            name: "CountryPhoneCodeTextField",
            targets: ["CountryPhoneCodeTextField"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jonahaung2/XUI", from: .init(stringLiteral: "1.0.0"))
    ],
    targets: [
        .target(
            name: "CountryPhoneCodeTextField",
            dependencies: [
                "XUI"
            ]),
        .testTarget(
            name: "CountryPhoneCodeTextFieldTests",
            dependencies: ["CountryPhoneCodeTextField"]),
    ]
)
