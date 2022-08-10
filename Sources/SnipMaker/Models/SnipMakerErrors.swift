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
    case parseError
    case parameterError
}

// MARK: - LocalizedError

extension SnipMakerErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .filesNotFound(let directory):
            return "No .tcbundle file in this directory: \(directory)"
        case .parseError:
            return "Parse error"
        case .parameterError:
            return "Can't build parameter"
        }
    }
}

