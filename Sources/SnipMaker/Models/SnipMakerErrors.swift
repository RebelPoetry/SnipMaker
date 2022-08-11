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
}

// MARK: - LocalizedError

extension SnipMakerErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .filesNotFound(let directory):
            return "No .tcbundle file in this directory: \(directory)"
        case .parsingError:
            return "Parse error"
        }
    }
}

