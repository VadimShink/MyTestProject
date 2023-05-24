//
//  AppDelegate.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var model: Model {
        
        let environment = ServerAgent.Environment.test
        
        let serverAgent = ServerAgent(environment: environment)
        
        let biometricAgent = BiometricAgent()
        
        let model = Model(serverAgent: serverAgent, biometricAgent: biometricAgent)
        
        return model
    }
}
