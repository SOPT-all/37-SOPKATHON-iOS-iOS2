//
//  MainTab.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/23/25.
//


import UIKit

enum MainTab: CaseIterable {
    case home
    case search
    case save
}

extension MainTab {
    var title: String {
        switch self {
        case .home: return "홈"
        case .search: return "검색"
        case .save: return "저장"
        }
    }
    
    var defaultIcon: UIImage? {
        switch self {
        case .home: return .homeDefault
        case .search: return .searchDefault
        case .save: return .saveDefault
        }
    }
    
    var selectedIcon: UIImage? {
        switch self {
        case .home: return .homeSelected
        case .search: return .searchSelected
        case .save: return .saveSelected
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .home: return TestSaveViewController()
        case .search: return TestSaveViewController()
        case .save: return TestSaveViewController()
        }
    }
}
