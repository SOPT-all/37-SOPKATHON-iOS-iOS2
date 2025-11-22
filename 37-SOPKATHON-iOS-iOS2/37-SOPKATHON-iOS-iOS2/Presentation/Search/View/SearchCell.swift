//
//  SearchCell.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 어재선 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class SearchCell: UITableViewCell, ReuseIdentifiable {
    
    
    
    //MARK: - UI
    private lazy var titleImage = UIImageView()
    private let titleLabel = UILabel()
    private let titleStackView = UIStackView()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }

    
    //MARK: - UI
    
    func setUI() {
        addSubviews(titleStackView)
    }
    
    func setStyle() {
        titleImage.do {
    
            $0.layer.backgroundColor = UIColor.gray200.cgColor
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.text = "제목"
            $0.textColor = .suntaBlack
            $0.font = .pretendard(.body_sb_14)
        }
        
        titleStackView.do {
            $0.addArrangedSubviews(titleImage,titleLabel)
            $0.axis = .horizontal
            $0.alignment = .leading
            $0.spacing = 12
        }
    }
    
    func setLayout() {
        titleStackView.snp.makeConstraints {
            $0.bottom.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
    }
}

#Preview {
    SearchCell()
}
