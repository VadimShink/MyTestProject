//
//  CustomTabBarView.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @ObservedObject var viewModel: CustomTabBarViewModel
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @State var localSelection: TabBarItem
    
    @Namespace private var namespace
    
    var body: some View {
        tabBarView
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        .main, .payments, .city, .chat, .more
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(viewModel: .init(model: .emptyMock), tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}

extension CustomTabBarView {
    
    private func tabViewVersion1(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
//        .foregroundColor(localSelection == tab ? Color.red : Color.white)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? Color.red.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private var tabBarView: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabViewVersion1(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color(hex: "1A1A1A").ignoresSafeArea(edges: .bottom))
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
}

extension CustomTabBarView {
    
    private func tabViewVersion2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? Color(hex: "1A1A1A") : Color.gray)
//        .background(localSelection == tab ? Color.red.opacity(0.2) : Color.clear)
//        .background(localSelection == tab ? Color(hex: "1A1A1A") : Color.clear)
//        .background(localSelection == tab ? .red : Color.clear)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
//                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabViewVersion2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}
