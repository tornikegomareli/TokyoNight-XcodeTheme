// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TokyoNight-XcodeTheme",
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Files.git", from: "4.0.0"),
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0")
    ],
    targets: [
        .target(name: "TokyoNight-XcodeTheme"),
    ]
)
