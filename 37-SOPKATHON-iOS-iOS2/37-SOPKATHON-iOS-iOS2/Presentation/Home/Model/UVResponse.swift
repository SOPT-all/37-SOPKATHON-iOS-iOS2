//
//  UVResponse.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 정윤아 on 11/23/25.
//

struct UVResponse: Codable {
    let status: Int
    let message: String
    let data: UVData
}

struct UVData: Codable {
    let uv: Double
    let description: String
}
