//
//  HomeAPI.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 정윤아 on 11/23/25.
//

import internal import Alamofire

enum HomeAPI {
    case getUV
}

extension HomeAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .getUV:
            return "/uv"   // 여기에 진짜 API path 넣기
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUV:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getUV:
            return .requestPlain   // 쿼리파라미터 없으면 그대로 사용
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
