//
//  MDCreatorImplementation.swift
//  
//
//  Created by Kazakh on 15.08.2022.
//

import Foundation

// MARK: - MDCreatorImplementation

final class MDCreatorImplementation {
    
}

// MARK: - MdCreator

extension MDCreatorImplementation: MDCreator {
    
    func create<T: MDFrame>(
        _ data: [[String: Any]],
        _ frame: T.Type
    ) -> String {
        
        var createdText = ""
        var snippetText = ""
        var isContinue = true
        
        for field in frame.allCases {
            if !field.mayRepeat {
                createdText += findText(data, createdText, field)
            }
        }
        while isContinue {
            for field in frame.allCases {
                if field.mayRepeat {
                    let partOfSnippet = findText(data, createdText, field)
                    if partOfSnippet != "Not found parameter" {
                        snippetText += partOfSnippet
                    } else {
                        isContinue = false
                        break
                    }
                }
            }
            createdText += snippetText
            snippetText = ""
        }
        return createdText
    }
    
    // MARK: - Private
    
    /// Finds the element according to raw template value
    ///
    ///  - Parameters:
    ///   - data: Data for search
    ///   - text: Already created text, it helps to indicate if this part alredy parsed
    ///   - nestingLevel: It needs to indicate nesting level of containers in given data
    ///  - Returns: String with founded text
    func findText<T: MDFrame>(
        _ data: [[String: Any]],
        _ text: String, _ field: T,
        _ nestingLevel: Int = 0
    ) -> String {
        var result = ""
        for file in data {
            for (dictKey, dictValue) in file {
                if field.value == dictKey, field.nestingLevel == nestingLevel {
                    if let string = dictValue as? String {
                        result = field.output(string)
                        if !text.contains(result) {
                            return result
                        }
                    }
                    
                }
            }
            for (_ , dictValue) in file {
                if let container = dictValue as? [[String:Any]] {
                    return findText(container, text, field, nestingLevel + 1)
                }
            }
        }
        return "Not found parameter"
    }
}
