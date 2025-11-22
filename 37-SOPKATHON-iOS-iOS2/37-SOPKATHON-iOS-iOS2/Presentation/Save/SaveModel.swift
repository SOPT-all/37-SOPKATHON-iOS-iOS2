//
//  SaveModel.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 홍준범 on 11/23/25.
//

import Foundation

public struct SaveModel: Codable {
    public var savedPlaceId: Int
    public var placeId: Int
    public var name: String
    public var imageUrl: String
    public var latitude: Double
    public var longitude: Double
    
    init(savedPlaceId: Int, placeId: Int, name: String, imageUrl: String, latitude: Double, longitude: Double) {
        self.savedPlaceId = savedPlaceId
        self.placeId = placeId
        self.name = name
        self.imageUrl = imageUrl
        self.latitude = latitude
        self.longitude = longitude
    }
    
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
