//
//  TestHomeViewController.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class TestHomeViewController: BaseViewController {
    
    private let HomeView = UIView()
    
    override func setStyle() {
        HomeView.do {
            $0.backgroundColor = .gray
        }
    }
    
    override func setUI() {
        view.addSubviews(HomeView)
    }
    
    override func setLayout() {
        HomeView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}
