//
//  SaveModel.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 홍준범 on 11/23/25.
//

import Foundation

struct SaveResponse: Codable {
    let status: Int
    let message: String
    let data: [SaveModel]
}

struct SaveModel: Codable {
     let savedPlaceId: Int
     let placeId: Int
     let name: String
     let imageUrl: String
     let latitude: Double
     let longitude: Double

    enum CodingKeys: String, CodingKey {
            case savedPlaceId
            case placeId
            case name
            case imageUrl
            case latitude
            case longitude
        }
}

extension SaveModel {
    static let mockData: [SaveModel] = [
            SaveModel(
                savedPlaceId: 501,
                placeId: 10,
                name: "Manly Beach",
                imageUrl: "https://example.com/images/manly.jpg",
                latitude: -33.8001,
                longitude: 151.2875
            ),
            SaveModel(
                savedPlaceId: 505,
                placeId: 15,
                name: "Bondi Beach",
                imageUrl: "https://example.com/images/bondi.jpg",
                latitude: -33.8915,
                longitude: 151.2767
            )
        ]
}
