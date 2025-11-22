
//
//  CustomNavigationBar.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/23/25.
//


import UIKit

import SnapKit
import Then

final class CustomNavigationBar: UIView {
    
    
    // MARK: - UI
    
    private let titleLabel = UILabel().then {
        $0.font = .pretendard(.body_sb_14)
        $0.textColor = .suntaBlack
        $0.textAlignment = .center
    }
    
    private let backButton = UIButton().then {
        $0.setImage(.iconLeft, for: .normal)
    }
    
    
    // MARK: - Properties
    
    var onBackButtonTap: (() -> Void)?
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .suntaWhite
        setLayout()
        setActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Set
    
    private func setLayout() {
        addSubviews(
            backButton,
            titleLabel
        )
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(backButton)
        }

    }
    
    private func setActions() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    
    // MARK: - Action Handlers
    
    @objc private func backButtonTapped() {
        onBackButtonTap?()
        print("back button tapped")
    }
    
    
    // MARK: - Public Methods
    
    func setTitle(_ text: String) {
        titleLabel.text = text
    }
    
}
