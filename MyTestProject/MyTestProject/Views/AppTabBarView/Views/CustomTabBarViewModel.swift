//
//  CustomTabBarViewModel.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import Foundation
import Combine

class CustomTabBarViewModel: ObservableObject {
    
    let action: PassthroughSubject<Action, Never> = .init()
    private var bindings = Set<AnyCancellable>()
    
    private let model: Model
    
    init(model: Model) {
        self.model = model
    }
}
