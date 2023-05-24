//
//  ChatViewModel.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import Foundation

class ChatViewModel: WithActionViewModel {
    
    private let model: Model
    
    init(model: Model) {
        self.model = model
    }
}
