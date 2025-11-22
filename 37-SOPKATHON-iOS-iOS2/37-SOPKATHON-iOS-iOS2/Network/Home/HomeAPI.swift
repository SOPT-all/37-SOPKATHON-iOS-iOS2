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
}

extension HomeAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .getTodayArticle:
            return "/home/article"   // TODO: 실제 엔드포인트로 수정
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTodayArticle:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getTodayArticle:
            return .requestPlain      // 쿼리 없으면 이대로
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}

