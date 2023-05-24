//
//  Model.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import Foundation
import Combine

class Model {
    
    //MARK: Interface
    let action: PassthroughSubject<Action, Never> = .init()
    
    //MARK: Services
    let serverAgent: ServerAgentProtocol
    let biometricAgent: BiometricAgentProtocol
    
    //MARK: Private
    private var bindings: Set<AnyCancellable>
    private let queue = DispatchQueue(label: "Vadim.Shinkarenko.MyTestProject", qos: .userInitiated, attributes: .concurrent)
    
    //MARK: Init
    init(serverAgent: ServerAgentProtocol, biometricAgent: BiometricAgentProtocol) {
        
        self.bindings = []
        
        // Location Agent
        self.serverAgent = serverAgent
        self.biometricAgent = biometricAgent
        
        action.send(ModelAction.App.Activated())
        
        bind()
    }
    
    private func bind() {
        serverAgent.action
            .receive(on: queue)
            .sink { [unowned self] action in
                
                switch action {
                        
                    case _ as ServerAgentAction.NetworkActivityEvent:
                        print("46 case _ as ServerAgentAction.NetworkActivityEvent:")
                        
                    default:
                        break
                }
            }
            .store(in: &bindings)
    }
}

extension Model {
    
    var authAvailableBiometricSensotType: BiometricSensorType? { biometricAgent.availableSensor }
}

extension Model {
    
    static var emptyMock: Model {
        
        let environment = ServerAgent.Environment.test
        
        let serverAgent = ServerAgent(environment: environment)
        
        let biometricAgent = BiometricAgent()
        
        let model = Model(serverAgent: serverAgent, biometricAgent: biometricAgent)
        
        return model
    }
}


