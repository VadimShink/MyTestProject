//
//  ServerCommands+Roadster.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 23.05.2023.
//

import Foundation

enum ServerCommands {
    
    enum RoadsterController {
        
        struct GetRoadsterModel: ServerCommand {
            
            let token: String? = nil
            let endpoint: String = "/v3/roadster"
            let method: ServerCommandMethod = .get
            let payload: Payload? = nil
            
            let parameters: [ServerCommandParameters]? = nil
            
            typealias Payload = EmptyData
            
            typealias Response = RoadsterModel
        }
    }
}
