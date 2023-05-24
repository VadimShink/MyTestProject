//
//  MyTestProjectApp.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import SwiftUI

@main
struct MyTestProjectApp: App {
    
    @Environment(\.colorScheme) var colorScheme
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var appTabBarViewModel: AppTabBarViewModel {
        
        let model = delegate.model
        
        model.action.send(ModelAction.App.Launched())
        
        return AppTabBarViewModel(model: model)
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            AppTabBarView(viewModel: appTabBarViewModel)
                .preferredColorScheme(.dark)
        }
    }
}
