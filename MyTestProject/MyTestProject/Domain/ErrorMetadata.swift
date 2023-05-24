//
//  ErrorMetadata.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 23.05.2023.
//

import Foundation

struct ErrorMetadata: Codable {
    
    let errors: [Error]?
    let messages: Messages?
    
    struct Error: Codable {
        
        let id: String
        let messages: [String]
    }
    
    
    struct Messages: Codable {
        let common: [String]
    }
}
