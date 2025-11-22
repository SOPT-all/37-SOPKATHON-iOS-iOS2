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
        SaveModel(savedPlaceId: 1, placeId: 1, name: "무슨 해변", imageUrl: "ㅋㅋ", latitude: 2, longitude: 2)
    ]
}
