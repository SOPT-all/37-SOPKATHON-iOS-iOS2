//
//  SaveDetailViewController.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 홍준범 on 11/23/25.
//

import UIKit

import SnapKit
import Then
import Moya

class SaveDetailViewController: BaseViewController {
    private let provider = MoyaProvider<DetailAPI>()
    private let placeId: Int
    private let naviBar = CustomNavigationBar()
    private var uvCard: UVCard?
    
    private var detail: PlaceDetail?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("📌 [DetailVC] viewDidLoad 실행됨")
           print("📌 [DetailVC] placeId = \(placeId)")
        fetchPlaceDetail()
    }
    
    // ✅ 커스텀 이니셜라이저 추가
       init(placeId: Int) {
           self.placeId = placeId
           super.init(nibName: nil, bundle: nil)
       }
       
       // ✅ 스토리보드용 이니셜라이저는 안 쓸 거니까 fatalError
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
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
        
        self.view.addSubviews(naviBar, timeStackView)
    }
    
    override func setLayout() {
        naviBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)   // 상태바 아래부터
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
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
    
    private func fetchPlaceDetail() {
        print("📡 [DetailVC] fetchPlaceDetail() 실행 — 요청 시작 placeId=\(placeId)")
           provider.request(.getPlaceDetail(placeId: placeId)) { [weak self] result in
               guard let self else { return }
               
               switch result {
               case .success(let response):
                   print("✅ [DetailVC] API 응답 성공 — statusCode: \(response.statusCode)")
                   do {
                       let decoded = try JSONDecoder().decode(PlaceDetailResponse.self,
                                                              from: response.data)
                       print("📥 [DetailVC] 디코딩 성공 — name: \(decoded.data.name), uv: \(decoded.data.uv)")
                       self.detail = decoded.data
                       
                       DispatchQueue.main.async {
                           self.updateUI(with: decoded.data)
                       }
                       
                   } catch {
                       print("❌ 디코딩 실패:", error)
                       if let json = String(data: response.data, encoding: .utf8) {
                           print("서버 응답 바디:", json)
                       }
                   }
                   
               case .failure(let error):
                   print("❌ 네트워크 실패:", error)
               }
           }
       }
    
    private func updateUI(with detail: PlaceDetail) {

        naviBar.setTitle(detail.name)

        let uvValue = detail.uv

        print("🌤 UV value:", uvValue)

        // 🔥 uvCard 객체 생성 (여기서 detail.description까지 넣어줌)
        let card = UVCard(uvLevel: uvValue, uvDescription: detail.description)
        self.uvCard = card

        view.addSubview(card)

        // 🔥 오토레이아웃
        card.snp.makeConstraints {
            $0.top.equalTo(naviBar.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }

        // timeStackView는 카드 아래쪽에 위치하게 업데이트
        timeStackView.snp.remakeConstraints {
            $0.top.equalTo(card.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        // 필요하면 추천 문구 변경
        // configureTimeLabels(for: uvValue)
    }
    
}
