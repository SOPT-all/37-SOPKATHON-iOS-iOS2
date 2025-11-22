//
//  TestSearchViewController.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class TestSearchViewController: BaseViewController {
    
    private let SearchView = UIView()
    
    override func setStyle() {
        SearchView.do {
            $0.backgroundColor = .gray
        }
    }
    
    override func setUI() {
        view.addSubviews(SearchView)
    }
    
    override func setLayout() {
        SearchView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}
