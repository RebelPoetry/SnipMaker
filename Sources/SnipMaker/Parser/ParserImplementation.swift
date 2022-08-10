//
//  ParserImplementation.swift
//  
//
//  Created by Kazakh on 10.08.2022.
//

import Foundation

// MARK: - ParserImplementation

final class ParserImplementation {
    
}

// MARK: - Parser

extension ParserImplementation: Parser {
    
    func findParameters(_ data: [String: Any]) -> [String: String] {
        var foundParameters: [String: String] = [:]
        let values = data.map(\.value)
        
        for value in values {
            if let dictionary = value as? [[String: Any]] {
                for dictionaryValue in dictionary {
                    let parameters = findParameters(dictionaryValue)
                    foundParameters.merge(parameters) { (current, _) in current }
                }
            } else if let array = value as? [Any] {
                for element in array {
                    if let string = element as? String {
                        let parameters = findParameters(string)
                        foundParameters.merge(parameters) { (current, _) in current }
                    }
                }
            } else if let string = value as? String {
                let parameters = findParameters(string)
                foundParameters.merge(parameters) { (current, _) in current }
            }
        }
        return foundParameters
    }
    
    // MARK: - Private
    
    /// Find the required parameters in the string.
    /// - Parameters:  String
    /// - Returns: [Parameter: ""]
    private func findParameters(_ string: String) -> [String: String] {
        var string = string
        var dictionaryOfParameters: [String: String] = [:]
        var nameOfParameter = ""
        
        while !string.isEmpty {
            let symbol = string.removeFirst()
            if symbol == "$" {
                let nextSymbol = string.removeFirst()
                if nextSymbol == "{" {
                    while let char = string.first, char.isLetter {
                        nameOfParameter += String(string.removeFirst())
                    }
                    dictionaryOfParameters.merge([nameOfParameter: ""]) { (current, _) in current }
                    nameOfParameter = ""
                }
            }
        }
        return dictionaryOfParameters
    }
}
