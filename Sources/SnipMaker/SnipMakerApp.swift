//
//  SnipMakerApp.swift
//  
//
//  Created by Kazakh on 20.08.2022.
//

import Foundation

// MARK: - SnipMakerApp

final class SnipMakerApp<ParserType, ConverterType, CreatorType>
where
ParserType: Parser,
ConverterType: Converter,
CreatorType: MDCreator {
    
    // MARK: - Properties
    
    /// Parser instance
    private let parser: ParserType
    
    /// File creator instance
    private let creator: CreatorType
    
    /// Converter instance
    private let converter: ConverterType
    
    /// Directory with files
    private let takeDirectory: String
    
    /// Directory for save file
    private let saveDirectory: String
    
    /// Default initializer
    /// - Parameters:
    ///   - takeDirectory: Directory with files
    ///   - saveDirectory: Directory for save file
    ///   - parser: Parser instance
    ///   - creator: File creator  instance
    ///   - converter: Converter instance
    init(
        takeDirectory: String,
        saveDirectory: String,
        parser: ParserType,
        creator: CreatorType,
        converter: ConverterType
    ) {
        self.takeDirectory = takeDirectory
        self.saveDirectory = saveDirectory
        self.parser = parser
        self.converter = converter
        self.creator = creator
    }
    
    /// Main function, that takes all .tcbundle files from directory, if exists, and then decode, parse and convert data.
    /// Then create .md files with the specified structure.
    /// - Throws: SnipMakerErrors
    func run() throws {
        
        let files = try createBundle(takeDirectory)
        if files.isEmpty {
            throw SnipMakerErrors.filesNotFound(takeDirectory)
        }
        
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
        let newFile = creator.create(convertedFiles, MDFrameImplementation.self)
        
        let manager = FileManager.default
        let path = saveDirectory + "/INCETRO - Bible of snippets.md"
        if manager.createFile(atPath: path, contents: newFile.data(using: .utf8)) {
            print("Done.")
        } else {
            print("File not created")
        }
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
