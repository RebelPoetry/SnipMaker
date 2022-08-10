//
//  TCFields.swift
//  
//
//  Created by Kazakh on 10.08.2022.
//

import Foundation

// MARK: - TCFields

struct TCFields: Codable {
    let description: String
    let supportedLanguages: [String]
    let expanders: [TCFieldExpanders]
    let isEnabled: Bool
    let name: String
}

