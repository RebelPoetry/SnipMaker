//
//  Parameters.swift
//  
//
//  Created by Kazakh on 14.08.2022.
//

import Foundation

// MARK: - Parameters

enum ParameterFunctions: String {
    
    case uppercase
    case ucfirst
    case lowercase
    case lcfirst
    
    func apply(_ string: String) throws -> String {
        switch self {
        case .uppercase:
            return string.uppercased()
        case .ucfirst:
            guard let first = string.first else {
                throw SnipMakerErrors.parameterError(".ucfirst")
            }
            return first.uppercased() + string.dropFirst()
        case .lowercase:
            return string.lowercased()
        case .lcfirst:
            guard let first = string.first else {
                throw SnipMakerErrors.parameterError(".lcfirst")
            }
            return first.lowercased() + string.dropFirst()
        }
    }
}
