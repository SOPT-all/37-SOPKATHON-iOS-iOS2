//
//  SaveDetailViewController.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 홍준범 on 11/23/25.
//

import UIKit

import SnapKit
import Then

class SaveDetailViewController: BaseViewController {
    private let timeStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .leading
        $0.layer.cornerRadius = 16
        $0.backgroundColor = .gray50
    }
    
    private let separator1: UIView = {
        let view = UIView()
        view.backgroundColor = .gray200
        return view
    }()
    
    private let separator2: UIView = {
        let view = UIView()
        view.backgroundColor = .gray200
        return view
    }()
    
    private let separator3: UIView = {
        let view = UIView()
        view.backgroundColor = .gray200
        return view
    }()
    
    
    private lazy var firstTime = makeTimeLabel(time: "18:00 선크림 바르기")
    private lazy var secondTime = makeTimeLabel(time: "18:00")
    private lazy var thirdTime = makeTimeLabel(time: "18:00")
    
    override func setStyle() {
        view.backgroundColor = .white
    }
    
    override func setUI() {
        timeStackView.addArrangedSubviews(firstTime, separator1, secondTime,separator2,  thirdTime,separator3)
        
        self.view.addSubviews(timeStackView)
    }
    
    override func setLayout() {
        timeStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.centerY.equalToSuperview()
        }
        
        separator1.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalTo(267)
        }
        
        separator2.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalTo(267)
        }
        
        separator3.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalTo(267)
        }
    }
    
    private func makeTimeLabel(time: String) -> UIStackView {
        let stackView = UIStackView().then {
            $0.axis = .horizontal
            $0.spacing = 5
            $0.distribution = .fill
            $0.isUserInteractionEnabled = true
        }
        
        let checkBox = UIImageView().then {
            $0.image = .checkboxDefault
            $0.contentMode = .scaleAspectFit
        }
        
        let label = UILabel().then {
            $0.text = time
            $0.font = .pretendard(.body_m_16)
            $0.textColor = .gray700
        }
        
        stackView.addArrangedSubviews(checkBox, label)
        checkBox.snp.makeConstraints {
            $0.width.height.equalTo(20)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox(_:)))
        
        stackView.addGestureRecognizer(tap)
        
        return stackView
    }
    
    @objc
    private func didTapCheckBox(_ sender: UITapGestureRecognizer) {
        guard let stackView = sender.view as? UIStackView,
        let checkBox = stackView.arrangedSubviews.first as? UIImageView else { return }
        
        if checkBox.image == .checkboxDefault {
            checkBox.image = .checkboxSelected
        } else {
            checkBox.image = .checkboxDefault
        }
    }
    
}

#Preview {
    SaveDetailViewController()
}
