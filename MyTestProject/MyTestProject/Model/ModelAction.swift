//
//  ModelAction.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import Foundation

enum ModelAction {
    
    enum App {
        
        struct Launched: Action { }
        
        struct Activated: Action { }
        
        struct Inactivated: Action { }
    }
}
