//
//  ConverterImplementation.swift
//  
//
//  Created by Kazakh on 11.08.2022.
//

import Foundation

// MARK: - ConverterImplementation

final class ConverterImplementation {
    
}

// MARK: - Converter

extension ConverterImplementation: Converter {
    
    func convert(_ data: [String: Any], with parameters: [String: String]) throws -> [String: Any] {
        var convertedData: [String: Any] = [:]
        for (dataKey,dataValue) in data {
            if let dictArray = dataValue as? [[String: Any]] {
                var newDictArray: [[String: Any]] = []
                for dictElement in dictArray {
                    newDictArray.append(try convert(dictElement, with: parameters))
                }
                convertedData[dataKey] = newDictArray
            } else if let anyArray = dataValue as? [Any] {
                if !anyArray.isEmpty {
                    var newAnyArray: [Any] = []
                    for arrayElement in anyArray {
                        if let stringElement = arrayElement as? String {
                            newAnyArray.append(try convertString(stringElement, with: parameters))
                        } else {
                            newAnyArray.append(arrayElement)
                        }
                    }
                    convertedData[dataKey] = newAnyArray
                }
            } else if let stringElement = dataValue as? String {
                convertedData[dataKey] = try convertString(stringElement, with: parameters)
            }
        }
        return convertedData
    }
    
    // MARK: - Private
    
    /// Convert string like func 'convert'
    /// - Parameters:
    ///  - givenString: String to convert
    ///  - parameters: Dictionary with parameters and their inserted values to replace (["parameter": "inserted value")])
    /// - Throws: unknownFunction (when parameter has an undefined function)
    /// - Returns: Converted string
    func convertString(_ givenString: String, with parameters: [String: String]) throws -> String {
        var string = givenString.filter { $0 != "/" }
        var convertedString = string
        var nameOfParameter = ""
        var nameOfFunction = ""
        var dictionaryOfUpdates: [String: String] = [:]
        
        for parameter in parameters {
            convertedString = convertedString.replacingOccurrences(of: "${\(parameter.key)}", with: "\(parameter.value)")
        }
        while !string.isEmpty {
            let symbol = string.removeFirst()
            if symbol == "$" {
                let nextSymbol = string.removeFirst()
                if nextSymbol == "{" {
                    while let char = string.first, char.isLetter {
                        nameOfParameter += String(string.removeFirst())
                    }
                    if let char = string.first, char == "." {
                        string.removeFirst()
                        while let char = string.first, char.isLetter {
                            nameOfFunction += String(string.removeFirst())
                        }
                        guard let function = ParameterFunctions(rawValue: nameOfFunction) else { throw SnipMakerErrors.unknownFunction(nameOfFunction)}
                        let keyForDictionary = "\(nameOfParameter).\(nameOfFunction)"
                        dictionaryOfUpdates[keyForDictionary] = try function.apply(parameters[nameOfParameter]!)
                        nameOfFunction = ""
                    }
                    nameOfParameter = ""
                }
            }
        }
        for parameter in dictionaryOfUpdates {
            convertedString = convertedString.replacingOccurrences(of: "${\(parameter.key)}", with: parameter.value)
        }
        return convertedString
    }
}
