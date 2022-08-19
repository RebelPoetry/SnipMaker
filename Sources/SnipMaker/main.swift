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
    
    mutating func run() throws {
        let app = SnipMakerApp(
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
