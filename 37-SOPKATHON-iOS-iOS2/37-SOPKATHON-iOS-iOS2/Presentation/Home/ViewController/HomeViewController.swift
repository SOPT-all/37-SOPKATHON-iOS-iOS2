//
//  HomeViewController.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 정윤아 on 11/23/25.
//

import UIKit

import SafariServices
import Moya

import Kingfisher
import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    private let provider = MoyaProvider<HomeAPI>()
    private var mockLists: [Home] = []
    //MARK: - UI
    
    private let logoImage = UIImageView()
    private var uvCard = UVCard(uvLevel: 2.0, uvDescription: "좋아요!")
    private let santaImage = UIImageView()
    private let articleLabel = UILabel()
    private let articleButton = UIButton()
    private let articleTitleLabel = UILabel()
    
    //연결 주소
    private var articleURL: URL?
    
    //자외선 값 저장용
    private var uvValue: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMockData()
        fetchTodayArticle()
        fetchUV()
        applyUV(uvString: 2.0, description: "좋아요!")
    }
    
    override func setUI() {
        self.view.addSubviews(logoImage, santaImage, uvCard, articleLabel, articleButton, articleTitleLabel)
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
            $0.font = .pretendard(.body_sb_16)
            $0.text = "오늘의 추천 아티클"
            $0.textAlignment = .left
        }
        
        uvCard.do {
            $0.layer.cornerRadius = 12
        }
        
        articleButton.do {
            $0.setImage(UIImage(named: "article"), for: .normal)
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
            $0.size.equalTo(32)
        }
        
        uvCard.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
        }

        santaImage.snp.makeConstraints {
            $0.top.equalTo(uvCard.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        articleLabel.snp.makeConstraints {
            $0.top.equalTo(santaImage.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().offset(20)
        }
        
        articleButton.snp.makeConstraints {
            $0.top.equalTo(articleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(130)
        }
        
        articleTitleLabel.snp.makeConstraints {
            $0.top.equalTo(articleButton.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().offset(20)
            $0.height.equalTo(21)
        }
    }
    
    private func loadMockData() {
        self.mockLists = mockHomes
        guard let mock = mockLists.first else {return}
        articleTitleLabel.text = mock.title
        articleURL = URL(string: mock.link)
        
        
    }
    
    // MARK: - Article API
    private func fetchTodayArticle() {
        provider.request(.getTodayArticle) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(HomeResponse.self, from: response.data)
                    let article = decoded.data
                    
                    print("Article 디코딩 성공")
                    print("title:", article.title)
                    print("imageURL:", article.imageURL)
                    
                    DispatchQueue.main.async {
                        self.articleTitleLabel.text = article.title
                        self.articleURL = URL(string: article.link)
                    
                        if let url = URL(string: article.imageURL) {
                            self.articleButton.kf.setImage(
                                with: url,
                                for: .normal,
                                completionHandler: { result in
                                    switch result {
                                    case .success(let value):
                                        print("Kingfisher 이미지 로드 성공:", value.source.url?.absoluteString ?? "")
                                    case .failure(let error):
                                        print("Kingfisher 로드 실패:", error)
                                    }
                                }
                            )
                            
                            self.articleButton.clipsToBounds = true
                            self.articleButton.imageView?.contentMode = .scaleAspectFill
                        } else {
                            print("URL 변환 실패:", article.imageURL)
                        }
                    }
                    
                } catch {
                    print("아티클 디코딩 실패:", error)
                    if let json = String(data: response.data, encoding: .utf8) {
                        print("응답 바디:", json)
                    }
                    self.loadMockData()
                }
                
            case .failure(let error):
                print("네트워크 실패:", error)
                self.loadMockData()
            }
        }
    }
        
        private func fetchUV() {
            provider.request(.getUV) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let response):
                    do {
                        // 전체 응답 디코딩
                        let decoded = try JSONDecoder().decode(UVResponse.self, from: response.data)
                        let uvData = decoded.data   // 실제 uv/description
                        
                        // UI 업데이트는 메인 스레드에서
                        DispatchQueue.main.async {
                            self.applyUV(
                                uvString: uvData.uv,
                                description: uvData.description
                            )
                        }
                    } catch {
                        print("UV 디코딩 에러:", error)
                        // 실패했을 때 기본값 넣고 싶으면 여기서 applyUV(…, …) 호출
                    }
                    
                case .failure(let error):
                    print("UV API 에러:", error)
                }
            }
        }
        
        private func updateSantaImage(for uv: Double) {
            let value = Int(uv.rounded())
            let imageName: String
            
            switch value {
            case 0...2:
                imageName = "img_santa_long_1"
            case 3...5:
                imageName = "img_santa_long_2"
            case 6...7:
                imageName = "img_santa_long_3"
            case 8...10:
                imageName = "img_santa_long_4"
            case 11:
                imageName = "img_santa_long_5"
            default:
                imageName = "santa_long_1"
            }
            
            santaImage.image = UIImage(named: imageName)
        }
        
    private func applyUV(uvString: Double, description: String) {
         // 목데이터 사용
         let mockUV = 2.0
         let mockDescription = "좋아요!"
         
         uvValue = mockUV
         updateSantaImage(for: mockUV)
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
