//
//  TCFieldExpanders.swift
//  
//
//  Created by Kazakh on 10.08.2022.
//

import Foundation

// MARK: - TCFieldExpanders

struct TCFieldExpanders: Codable {
    
    // MARK: - Properties
    
    let outputTemplate: String
    let isEnabled: Bool
    let name: String
    let supportedLanguages: [String]
    let description: String
    let identifier: String
    let pattern: String
}

