//
//  Tabbar.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class Tabbar: UITabBarController {

        override func viewDidLoad() {
            super.viewDidLoad()
            configureTabBar()
        }
        
        private func configureTabBar() {
            let controllers = MainTab.allCases.map { tab in
                let vc = tab.viewController
                vc.tabBarItem = UITabBarItem(
                    title: tab.title,
                    image: tab.defaultIcon,
                    selectedImage: tab.selectedIcon
                )
                vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.pretendard(.body_r_10)], for: .normal)
                return vc
            }
            
            viewControllers = controllers
            tabBar.tintColor = .primary600
            tabBar.unselectedItemTintColor = .gray300
            tabBar.backgroundColor = .suntaWhite
    }
}

#Preview {
    Tabbar()
}
