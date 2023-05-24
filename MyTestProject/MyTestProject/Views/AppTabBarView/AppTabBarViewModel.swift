//
//  AppTabBarViewModel.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import Foundation
import Combine

class AppTabBarViewModel: ObservableObject {
    
    let action: PassthroughSubject<Action, Never> = .init()
    
    let items: [WithActionViewModel]
    
    @Published var link: Link? { didSet { isLinkActive = link != nil } }
    @Published var isLinkActive: Bool = false
    @Published var fullScreenCover: FullScreenCover?
    
    @Published var tabBarContainer: TabBarContainerViewModel
    @Published var tabSelection: TabBarItem = .main
    
    private let model: Model
    
    private var bindings = Set<AnyCancellable>()
    
    init(model: Model) {
        self.model = model
        self.tabBarContainer = TabBarContainerViewModel(model: model)
        
        let items = Self.createItems(from: model)
        self.items = items
        
        bind()
    }
    
    func bind() {
        
        model.action
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] action in
                print("action is ")
                
                switch action {
                        
                    case _ as ModelAction.App.Activated:
                        print("ModelAction.App.Activated")
                        
                    default:
                        print("break")
                        break
                }
            }
            .store(in: &bindings)
    }
    
    static func createItems(from model: Model) -> [WithActionViewModel] {
        
        return [
            MainViewModel(model: model),
            PaymentsViewModel(model: model),
            CityViewModel(model: model),
            ChatViewModel(model: model),
            MoreViewModel(model: model)
        ]
    }
    
    struct FullScreenCover: Identifiable {
        let id = UUID()
        let type: FullScreenType
        
        enum FullScreenType {
            
//            case pinCode(AuthPinCodeViewModel)
        }
    }
    
    enum Link {
        
    }
}

//MARK: - WithActionViewModel
class WithActionViewModel: Identifiable, ObservableObject {
    
    var action: PassthroughSubject<Action, Never> = .init()
    
    var bindings = Set<AnyCancellable>()
}
