//
//  SaveViewCell.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 홍준범 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class SaveViewCell: UITableViewCell, ReuseIdentifiable {
    private let saveImage = UIImageView().then {
        $0.image = UIImage(systemName: "rectangle")
        $0.contentMode = .scaleAspectFit
    }
    
    private let saveName = UILabel().then {
        $0.text = "스내퍼 록스 비치"
        $0.font = .pretendard(.body_sb_14)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        contentView.backgroundColor = .white
    }
    
    private func setUI() {
        contentView.addSubviews(saveImage, saveName)
    }
    
    private func setLayout() {
        saveImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        saveName.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(saveImage.snp.trailing).offset(12)
        }
    }
    
    func configure() {
        saveImage.image = UIImage(systemName: "rectangle.fill")
        saveName.text = "zzzz"
    }
}

#Preview {
    SaveViewCell()
}
