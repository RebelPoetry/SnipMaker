//
//  File.swift
//  
//
//  Created by Kazakh on 11.08.2022.
//

import Foundation

// MARK: - Parser

protocol Parser {
    
    /// Find the  parameters in some data.
    ///
    /// The parameters are specified in the form ${parameterName} or ${parameterName.someFunction}.
    /// The parameter name must consist only of letters
    ///
    /// Example:
    ///
    ///     let data: [String: Any] = [
    ///           "firstProperty": ["hello", "Mr." ,"${firstParameter}", "!"]
    ///           "secondProperty": [
    ///             "hello": "world",
    ///             "someText": "some text ${secondParameter} some text",
    ///             "wrongParameter": "dor ${wrongParameter5}"
    ///           ],
    ///           "thirdProperty": "some text ${thirdParameter} some text"
    ///          ]
    ///     let parametersFromSomeData = findParameters(from: someData)
    ///
    /// And 'parametersFromSomeData' has the form:
    ///
    ///     [
    ///       "firstParameter": "",
    ///       "secondParameter": "",
    ///       "thirdParameter": ""
    ///     ]
    ///
    /// - Parameter data: Data in which you need to find all necessary parameters
    /// - Returns: Dictionary with the names of the required parameters. Values are set as an empty strings
    func findParameters(_ data: [String: Any]) -> [String: String]
}
