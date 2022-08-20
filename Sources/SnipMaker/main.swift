import Foundation
import ArgumentParser

// MARK: - SnipMaker

struct SnipMaker: ParsableCommand {
    
    // MARK: - Properties
    
    static let configuration = CommandConfiguration(abstract: "Create a .md file with help of .tcbundle files", version: "0.0.0")
    
    @Option(name: .shortAndLong, help: "Directory for save .md file")
    private var saveDirectory = FileManager.default.currentDirectoryPath
    
    @Option(name: .shortAndLong, help: "Directory for take .tcbundle files")
    private var takeDirectory = FileManager.default.currentDirectoryPath
    
    @Option(name: .shortAndLong, help: "Push to git")
    private var push = false

    
    mutating func run() throws {
        let app = SnipMakerApp(
            pushToGit: push,
            takeDirectory: takeDirectory,
            saveDirectory: saveDirectory,
            parser: ParserImplementation(),
            creator: MDCreatorImplementation(),
            converter: ConverterImplementation()
        )
        try app.run()
    }
}

SnipMaker.main()
