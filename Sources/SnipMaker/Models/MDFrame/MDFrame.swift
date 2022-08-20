//
//  MDFrame.swift
//  
//
//  Created by Kazakh on 18.08.2022.
//

import Foundation

// MARK: - MDFrame

/// Protocol for structure of .md file, where cases are keys in given .json files
/// Raw values of cases are names of these keys
/// Raw value can contain " " for duplicate keys
protocol MDFrame: CaseIterable, RawRepresentable where Self.RawValue == String {
    
    /// The function that returns a part of future file
    func output(_ element: Any) -> String
    
    /// Get raw value of case
    var value: String {
        get
    }
    
    /// Get neasting level of container in given file
    var nestingLevel: Int {
        get
    }
    
    /// Indicates if key can repeat in given file
    var mayRepeat: Bool {
        get
    }
}
