// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

func shell(_ command: String) -> String? {
    let task = Process()
    let pipe = Pipe()

    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/bash"
    task.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)
    return output?.trimmingCharacters(in: .whitespacesAndNewlines)
}

func isBrewInstalled() -> Bool {
    return shell("which brew") != nil
}

func installBrew() {
    let brewInstallCommand = "/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    print("Installing Homebrew...")
    _ = shell(brewInstallCommand)
}

func isIosevkaInstalled() -> Bool {
    let fontListCommand = "fc-list :family | grep -i 'Iosevka Fixed'"
    return shell(fontListCommand) != nil
}

func installIosevkaFont() {
    let brewCaskInstallCommand = "brew install --cask font-iosevka"
    print("Installing Iosevka Fixed font...")
    _ = shell(brewCaskInstallCommand)
}

if !isBrewInstalled() {
    installBrew()
}

if !isIosevkaInstalled() {
    installIosevkaFont()
} else {
    }

