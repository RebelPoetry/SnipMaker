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
        if files.isEmpty {
            throw SnipMakerErrors.filesNotFound(takeDirectory)
        }
        
        let parser = ParserImplementation()
        let converter = ConverterImplementation()
        var parsedFiles: [[String: Any]] = []
        var parameters: [String: String] = [:]
        var convertedFiles: [[String: Any]] = []
        
        for file in files {
            if let jsonData = try String(contentsOfFile: "\(takeDirectory)/\(file)").data(using: .utf8) {
                guard let parsedData = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
                    throw SnipMakerErrors.parsingError
                }
                parsedFiles.append(parsedData)
                parameters.merge(parser.findParameters(parsedData)) { (current, _) in current }
            }
        }
        for (nameOfParameter, _) in parameters {
            print("Enter value for parameter: '\(nameOfParameter)'")
            parameters[nameOfParameter] = readLine()
        }
        for parsedFile in parsedFiles {
            convertedFiles.append(try converter.convert(parsedFile, with: parameters))
        }
        print(convertedFiles)
        /*let manager = FileManager.default
        let path = saveDirectory + "/tastydrop.md"
        print(manager.createFile(atPath: path, contents: "hey".data(using: .utf8)))
        print("sdf")*/
        
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
