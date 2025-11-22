//
//  DetailModel.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 홍준범 on 11/23/25.
//

import Foundation

struct PlaceDetailResponse: Decodable {
    let status: Int
    let message: String
    let data: PlaceDetail
}

struct PlaceDetail: Decodable {
    let placeId: Int
    let name: String
    let uv: Double
    let description: String
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case placeId, name, uv, description, latitude, longitude
    }
}
