//
//  TestSaveViewController.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class TestSaveViewController: BaseViewController {
    
    private let SaveView = UIView()
    
    override func setStyle() {
        SaveView.do {
            $0.backgroundColor = .gray
        }
    }
    
    override func setUI() {
        view.addSubviews(SaveView)
    }
    
    override func setLayout() {
        SaveView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
