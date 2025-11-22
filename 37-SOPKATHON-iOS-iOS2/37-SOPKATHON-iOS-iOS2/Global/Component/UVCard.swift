//
//  UVCard.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class UVCard: UIView {
    
    private let uvLevel: Double
    private let uvType: CardType
    
    private let titlelabel = UILabel()
    private let UVLabel = UILabel()
    private let subTitleLabel = UILabel()
    
    init(uvLevel: Double, uvDescription: String) {
        self.uvLevel = uvLevel
        self.uvType = CardType(level: uvLevel)
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = uvType.backgroundColor
        
        titlelabel.do {
            $0.text = uvType.title
            $0.font = .pretendard(.head_sb_20)
            $0.textColor = .gray700
        }
        UVLabel.do {
            $0.text = "\(uvLevel)"
            $0.font = .pretendard(.title_eb_56)
            $0.textColor = .gray900
        }
        subTitleLabel.do {
            $0.text = uvType.subtitle
            $0.font = .pretendard(.body_sb_16)
            $0.textColor = .gray600
            $0.numberOfLines = 0
            $0.textAlignment = .center
        }
        self.addSubviews(
            titlelabel,
            UVLabel,
            subTitleLabel
        )
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(335)
            $0.height.equalTo(186)
        }
        
        titlelabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(12)
        }
        
        UVLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titlelabel.snp.bottom)
        }
        subTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.snp.bottom).offset(-12)
        }
    }
    
}
