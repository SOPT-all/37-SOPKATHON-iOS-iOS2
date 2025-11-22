//
//  HomeAPI.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 정윤아 on 11/23/25.
//

import Moya
internal import Alamofire

enum HomeAPI {
    case getTodayArticle
    case getUV                 // 🔥 UV 추가
}

extension HomeAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .getTodayArticle:
            return "/home/article"   // 예시
        case .getUV:
            return "/home/uv?latitude=-33.89143205&longitude=151.2768124"       // ✅ UV 조회 엔드포인트
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}

