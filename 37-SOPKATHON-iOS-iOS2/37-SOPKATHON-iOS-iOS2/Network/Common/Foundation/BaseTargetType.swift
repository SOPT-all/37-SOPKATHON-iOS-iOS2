//
//  BaseTargetType.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/22/25.
//

import Foundation

import Moya
//import Alamofire

protocol BaseTargetType: TargetType { }

extension BaseTargetType{

    var baseURL: URL {
        return URL(string:"https://api.sopkathon.p-e.kr")!
    }

    var headers: [String : String]? {
        let header = [
            "Content-Type": "application/json"
        ]
        return header
    }

    var sampleData: Data {
        return Data()
    }
}
