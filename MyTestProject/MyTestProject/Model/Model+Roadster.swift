//
//  Model+Roadster.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 23.05.2023.
//

import Foundation

extension Model {
    
    func handleRoadsterGetRequest() async throws -> RoadsterModel {
        
        let command = ServerCommands.RoadsterController.GetRoadsterModel()
        return try await serverAgent.executeCommand(command: command)
    }
}
