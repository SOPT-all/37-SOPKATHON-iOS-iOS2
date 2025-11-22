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
        
//        private let provider = MoyaProvider<HomeAPI>()
        private var mockLists: [Home] = []
        //MARK: - UI
        
        private let logoImage = UIImageView()
        private let uvCardView = UIView()
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
//            fetchTodayArticle()
            
            applyUV(
                    uvString: "5",
                    description: "날씨가 도와주는 날이네요! 지금 당장 어디로든 떠나보세요!"
                )
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
                $0.size.equalTo(32)
            }
            
    //        uvCardView.snp.makeConstraints {
    //            $0.top.equalTo(logoImage.snp.bottom).offset(7)
    //            $0.horizontalEdges.equalToSuperview().inset(20)
    //            $0.height.equalTo(186)
    //        }

            
            santaImage.snp.makeConstraints {
                $0.top.equalTo(logoImage.snp.bottom).offset(16)
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
                $0.leading.equalToSuperview().offset(19.5)
                $0.height.equalTo(21)
            }
        }
        
        private func loadMockData() {
            self.mockLists = mockHomes
            guard let mock = mockLists.first else {return}
            articleTitleLabel.text = mock.title
            articleURL = URL(string: mock.link)
        }
        
//        private func fetchTodayArticle() {
//            provider.request(.getTodayArticle) { [weak self] result in
//                guard let self = self else { return }
//                
//                switch result {
//                case .success(let response):
//                    do {
//                        let article = try JSONDecoder().decode(Home.self, from: response.data)
//                        
//                        DispatchQueue.main.async {
//                            // UI 바인딩
//                            self.articleTitleLabel.text = article.title
//                            self.articleURL = URL(string: article.link)
//                        }
//                        
//                    } catch {
//                        print("❌ 디코딩 실패:", error)
//                    }
//                    
//                case .failure(let error):
//                    print("❌ 네트워크 실패:", error)
//                    self.loadMockData()
//                }
//            }
//        }
        
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
        
        private func applyUV(uvString: String, description: String) {
            let uv = Double(uvString) ?? 0
            uvValue = uv
            
            updateSantaImage(for: uv)
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
