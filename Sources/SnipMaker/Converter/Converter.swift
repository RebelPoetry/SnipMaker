//
//  Converter.swift
//  
//
//  Created by Kazakh on 14.08.2022.
//

import Foundation

// MARK: - Converter

protocol Converter {
    
    /// Converts file data:
    /// - Removes bakcslashes
    /// - Replace parameters with their inserted values and applyed functions
    ///
    /// Example:
    ///
    ///     let parameters = ["name": "bob", "surname": "vachevsky", "toy": "car" ]
    ///     let exampleData = [
    ///         "firstField": ["text ${name.ucfirst} // a/nd ${surname}", "${toy.uppercase}"]
    ///         "secondField": "${name}"
    ///     ]
    ///     let convertedData = convert(exampleData, with: parameters)
    ///
    /// The 'convertedData' has a form:
    ///
    ///     [
    ///         "firstField": ["text Bob  and vachevsky", "CAR"]
    ///         "secondField": "bob"
    ///     ]
    ///
    /// - Parameters:
    ///  - data: File to convert
    ///  - parameters: Dictionary of parameters (["parameter": "inserted value")])
    /// - Throws: unknownFunction (when parameter has an undefined function)
    /// - Returns: Converted file data
    func convert(_ data: [String: Any], with parameters: [String: String]) throws -> [String: Any]
}
