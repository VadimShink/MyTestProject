//
//  BiometricAgentProtocol.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import Foundation

protocol BiometricAgentProtocol {
    
    var availableSensor: BiometricSensorType? { get }
    
    func unlock(with sensor: BiometricSensorType, completion: @escaping (Result<Bool, BiometricAgentError>) -> Void)
}

enum BiometricAgentError: Error {
    
    case unableUsePolicy(Error?)
    case failedEvaluateWithError(Error)
}
