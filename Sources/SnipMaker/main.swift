import Foundation
import ArgumentParser

struct SnipMaker: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Create a .md file with help of .tcbundle files", version: "0.0.0")
    
    @Option(name: .shortAndLong, help: "Directory for save .md file")
    private var saveDirectory = FileManager.default.currentDirectoryPath
    
    @Option(name: .shortAndLong, help: "Directory for take .tcbundle files")
    private var takeDirectory = FileManager.default.currentDirectoryPath
    
    @Flag(name: .shortAndLong, help: "Create the Bible of snippets")
    private var create = false
    
    mutating func run() throws {
        let files = try createBundle(takeDirectory)
        if files.count == 0 {
            throw SnipMakerErrors.filesNotFound(takeDirectory)
        }
        
        let parser = ParserImplementation()
        var parsedFiles: [[String: Any]] = []
        var parameters: [String: String] = [:]
        
        for file in files {
            if let jsonData = try String(contentsOfFile: "\(takeDirectory)/\(file)").data(using: .utf8) {
                guard let parsedData = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
                    throw SnipMakerErrors.parseError
                }
                parsedFiles.append(parsedData)
                parameters.merge(parser.findParameters(parsedData)) { (current, _) in current }
            }
        }
        print(parameters)
    }
    
    // MARK: - Private
    
    /// Find .tcbundle files in given directory and return an array with names of them
    /// - Parameter directory: Directory for pick files
    /// - Throws: FileManager errors
    /// - Returns: array of .tcbundle files names
    private func createBundle(_ directory: String) throws -> [String] {
        let files = try FileManager.default.contentsOfDirectory(atPath: directory)
        return files.filter { $0.contains(".tcbundle") }
    }
}

SnipMaker.main()
