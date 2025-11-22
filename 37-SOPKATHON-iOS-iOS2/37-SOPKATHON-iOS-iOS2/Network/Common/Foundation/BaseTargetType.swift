//
//  BaseTargetType.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/22/25.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType{

    var baseURL: URL {
        /// 실제 url로 바꿔주세요.
//        return URL(string: "https://62268471-962b-47f7-bf38-92dd2a82213e.mock.pstmn.io/")!
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
