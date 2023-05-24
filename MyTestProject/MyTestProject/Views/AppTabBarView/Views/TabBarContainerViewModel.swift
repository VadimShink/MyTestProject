//
//  TabBarContainerViewModel.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import Foundation
import Combine

class TabBarContainerViewModel: ObservableObject {
    
    let action: PassthroughSubject<Action, Never> = .init()
    
    private let model: Model
    
    @Published var tabs: [TabBarItem] = []
    @Published var customTabBarViewModel: CustomTabBarViewModel
    
    init(model: Model) {
        self.model = model
        self.customTabBarViewModel = CustomTabBarViewModel(model: model)
    }
    
}
