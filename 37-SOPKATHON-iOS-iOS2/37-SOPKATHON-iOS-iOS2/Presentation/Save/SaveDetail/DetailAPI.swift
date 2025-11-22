//
//  DetailAPI.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 홍준범 on 11/23/25.
//

import Moya
internal import Alamofire

enum DetailAPI {
    case getPlaceDetail(placeId: Int)// 🔥 UV 추가
}

extension DetailAPI: BaseTargetType {
    
    var path: String {
        switch self {
            case .getPlaceDetail(let placeId):
                return "/places/\(placeId)/detail"
            }
    }
    
    var method: Moya.Method {
        switch self {
               case .getPlaceDetail:
                   return .get
               }
    }
    
    var task: Task {
            switch self {
            case .getPlaceDetail:
                return .requestPlain
            }
        }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}
