//
//  TabBarItem.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import Foundation


enum TabBarItem: Hashable {
    
    case main, payments, city, chat, more
    
    var iconName: String {
        switch self {
            case .main: return "creditcard.circle"
            case .payments: return "circle.inset.filled"
            case .city: return "building.columns.circle"
            case .chat: return "message.circle"
            case .more: return "ellipsis.circle"
        }
    }
    
    // Unused
    var iconSelectedName: String {
        switch self {
            case .main: return "icTabBarHomeActive"
            case .payments: return "icTabBarNewsActive"
            case .city: return "icTabBarServicesActive"
            case .chat: return "icTabBarLearningActive"
            case .more: return ""
        }
    }
    
    var title: String {
        switch self {
            case .main: return "Главная"
            case .payments: return "Платежи"
            case .city: return "Город"
            case .chat: return "Чат"
            case .more: return "Еще"
        }
    }
}
