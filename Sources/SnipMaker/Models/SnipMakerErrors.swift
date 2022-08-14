//
//  SnipMakerErrors.swift
//  
//
//  Created by Kazakh on 10.08.2022.
//

import Foundation

// MARK: - BibleErrors

enum SnipMakerErrors: Error {
    case filesNotFound(String)
    case parsingError
    case parameterError(String)
    case unknownFunction(String)
}

// MARK: - LocalizedError

extension SnipMakerErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .filesNotFound(let directory):
            return "No .tcbundle file in this directory: \(directory)"
        case .parsingError:
            return "Parse error"
        case .parameterError(let function):
            return "Can't apply \(function) to parameter"
        case .unknownFunction(let function):
            return "'\(function)' is not supports yet"
        }
    }
}
