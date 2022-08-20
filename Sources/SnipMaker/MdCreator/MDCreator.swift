//
//  MDCreator.swift
//  
//
//  Created by Kazakh on 20.08.2022.
//

import Foundation

// MARK: - MdCreator

protocol MDCreator {
    
    /// Create string with data  in .md format
    ///
    /// - Parameters:
    ///   - data: Data t
    ///   - frame: A template which describes structure of .md file, 
    /// - Returns: String with .md format
    func create<T: MDFrame>(
        _ data: [[String: Any]],
        _ frame: T.Type
    ) -> String
}
