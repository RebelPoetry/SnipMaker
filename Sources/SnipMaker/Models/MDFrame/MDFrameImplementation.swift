//
//  MDFrameImplementation.swift
//
//
//  Created by Kazakh on 18.08.2022.
//

import Foundation

// MARK: - MDFrameImplementation

enum MDFrameImplementation: String, MDFrame, CaseIterable {
    
    // MARK: - Cases
    
    case headerField = "name"
    case descriptionField = "description"
    case nameField = "name "
    case syntaxField = "pattern"
    case inputField = "pattern "
    case outputField = "output_template"
    
    func output(_ element: Any) -> String {
        switch self {
        case .headerField:
            return """
            # \(element)
            
            """
        case .descriptionField:
            return """
            
            \(element)
            
            """
        case .nameField:
            return """
            
            ------
            
            ### \(element)
            
            """
        case .syntaxField:
            return """
            Syntax:
            ```swift
            \(element)
            ```
            
            """
        case .inputField:
            return """
            Input example:
            ```swift
            \(element)
            ```
            
            """
        case .outputField:
            return """
            Output:
            ```swift
            \(element)
            ```
            
            """
        }
    }
    
    var nestingLevel: Int {
        switch self {
        case .headerField, .descriptionField:
            return 0
        default:
            return 1
        }
    }
    var value: String {
        return self.rawValue.filter{$0 != " "}
    }
    var mayRepeat: Bool {
        switch self {
        case .headerField, .descriptionField:
            return false
        default:
            return true
        }
    }
}
