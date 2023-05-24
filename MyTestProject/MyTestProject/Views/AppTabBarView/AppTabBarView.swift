//
//  AppTabBarView.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import SwiftUI

struct AppTabBarView: View {
    
    @ObservedObject var viewModel: AppTabBarViewModel
    
    var body: some View {

        NavigationView {
            
            GeometryReader { _ in
                
                ZStack {
                    
                    TabBarContainerView(viewModel: viewModel.tabBarContainer, selection: $viewModel.tabSelection) {
                        
                        ForEach(viewModel.items) { item in
                            
                            switch item {
                                    
                                case let mainViewModel as MainViewModel:
                                    MainView(viewModel: mainViewModel)
                                        .tabBarItem(tab: .main, selection: $viewModel.tabSelection)
                                    
                                case let paymentsViewModel as PaymentsViewModel:
                                    PaymentsView(viewModel: paymentsViewModel)
                                        .tabBarItem(tab: .payments, selection: $viewModel.tabSelection)
                                    
                                case let cityViewModel as CityViewModel:
                                    CityView(viewModel: cityViewModel)
                                        .tabBarItem(tab: .city, selection: $viewModel.tabSelection)
                                    
                                case let chatViewModel as ChatViewModel:
                                    ChatView(viewModel: chatViewModel)
                                        .tabBarItem(tab: .chat, selection: $viewModel.tabSelection)
                                    
                                case let moreViewModel as MoreViewModel:
                                    MoreView(viewModel: moreViewModel)
                                        .tabBarItem(tab: .more, selection: $viewModel.tabSelection)
                                    
                                default:
                                    EmptyView()
                            }
                        }
                    }
                }
            }
        }
    }
}


struct AppTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView(viewModel: .init(model: .emptyMock))
    }
}
