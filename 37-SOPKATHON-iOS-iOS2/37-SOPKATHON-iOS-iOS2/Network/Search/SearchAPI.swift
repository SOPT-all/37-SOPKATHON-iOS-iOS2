//
//  SearchAPI.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 어재선 on 11/23/25.
//

import Moya
internal import Alamofire


enum SearchAPI {
    case getHotplace
    case getPlace(String)
}

extension SearchAPI: BaseTargetType {
    var path: String {
        switch self {
        case .getHotplace:
            return "/search/hotplace"
        case .getPlace:
            return "/places"
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getHotplace:
            return .get
        case .getPlace:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getHotplace:
            return .requestPlain
        case .getPlace(let string):
            return .requestParameters(
                parameters: ["keyword": string],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    
    
}

