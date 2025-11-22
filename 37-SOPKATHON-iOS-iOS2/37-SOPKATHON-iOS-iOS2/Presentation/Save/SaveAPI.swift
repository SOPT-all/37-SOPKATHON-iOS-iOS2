//
//  SaveAPI.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 홍준범 on 11/23/25.
//

import Moya
internal import Alamofire

enum SaveAPI {
    case getMyPlace// 🔥 UV 추가
}

extension SaveAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .getMyPlace:
            return "/my/places"
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
