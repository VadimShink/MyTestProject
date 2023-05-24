//
//  TabBarContainerView.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import SwiftUI


struct TabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    
    @ObservedObject var viewModel: TabBarContainerViewModel
    
    init(
        viewModel: TabBarContainerViewModel,
        selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        
        self.viewModel = viewModel
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.bottom, 50)
            
            CustomTabBarView(viewModel: viewModel.customTabBarViewModel, tabs: viewModel.tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.viewModel.tabs = value
        }
    }
}

struct TabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        .main, .payments, .city, .chat, .more
    ]
    
    static var previews: some View {
        TabBarContainerView(viewModel: .init(model: .emptyMock), selection: .constant(tabs[2])) {
            Color.blue
        }
    }
}
