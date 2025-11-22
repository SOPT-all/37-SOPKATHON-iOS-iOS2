//
//  HomeViewController.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 정윤아 on 11/23/25.
//

import UIKit
import SafariServices

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    private var mockLists: [Home] = []
    //MARK: - UI
    
    private let logoImage = UIImageView()
//    private let 컴포넌트
    private let santaImage = UIImageView()
    private let articleLabel = UILabel()
    private let articleButton = UIButton()
    private let articleTitleLabel = UILabel()
    
    //연결 주소
    private var articleURL: URL? = URL(string: "https://www.amc.seoul.kr/asan/healthinfo/disease/diseaseDetail.do?contentId=31545")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMockData()
    }
    
    override func setUI() {
        self.view.addSubviews(logoImage, santaImage, articleLabel, articleButton, articleTitleLabel)
    }
    override func setStyle() {
        
        logoImage.do {
            $0.image = UIImage(named: "logo")
        }
        
        santaImage.do {
            $0.image = UIImage(named: "santa")
        }
        
        articleLabel.do {
            $0.textColor = .suntaBlack
//            $0.attributedText = NSAttributedString.pretendard(.body_sb_16, text: "오늘의 추천 아티클")
            $0.font = .systemFont(ofSize: 16)
            $0.text = "오늘의 추천 아티클"
            $0.textAlignment = .left
        }
        
        articleButton.do {
            $0.setImage(UIImage(named: "article"), for: .normal)
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(didTapArticleButton), for: .touchUpInside)
        }
        
        articleTitleLabel.do {
            $0.textColor = .suntaBlack
            $0.font = .systemFont(ofSize: 16)
            $0.text = "아티클 제목"
            $0.textAlignment = .left
        }
    }
    
    override func setLayout() {
        
        logoImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(13)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(52)
            $0.height.equalTo(24)
        }
        
        santaImage.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(16)
        }
        
        articleLabel.snp.makeConstraints {
            $0.top.equalTo(santaImage.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().offset(19.5)
        }
        
        articleButton.snp.makeConstraints {
            $0.top.equalTo(articleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(19.5)
            $0.height.equalTo(130)
        }
        
        articleTitleLabel.snp.makeConstraints {
            $0.top.equalTo(articleButton.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(19.5)
            $0.height.equalTo(21)
        }
    }
    
    private func loadMockData() {
        self.mockLists = mockDatas
        guard let mock = mockLists.first else {return}
        articleTitleLabel.text = mock.title
        articleURL = URL(string: mock.link)
    }
    
    @objc
        private func didTapArticleButton() {
            guard let url = articleURL else { return }
            
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true)
        }
}

#Preview {
    Tabbar()
}
