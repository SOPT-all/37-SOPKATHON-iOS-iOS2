//
//  BaseViewController.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/22/25.
//


import UIKit

import SnapKit
import Then

class BaseViewController: UIViewController {
    
    /// Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
        setDelegate()
        setAction()
    }
    
    /// UI 컴포넌트 속성 설정 (do 메서드 관련)
    func setStyle() {}
    
    /// UI 위계 설정 (addSubView 등)
    func setUI() {}
    
    /// 오토레이아웃 설정 (SnapKit 코드 관련)
    func setLayout() {}
    
    /// Delegate, DataSource 설정
    func setDelegate() {}
    
    /// Action 함수
    func setAction() {}
    
    /// Override
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
