//
//  SearchHotplaceResponse.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 어재선 on 11/23/25.
//

import Foundation

// MARK: - SearchHotplaceResponse
struct SearchHotplaceResponse: Codable {
    let placeID: Int
    let name: String
    let imageURL: String
    let latitude, longitude: Double

    enum CodingKeys: String, CodingKey {
        case placeID = "placeId"
        case name
        case imageURL = "imageUrl"
        case latitude, longitude
    }
}

extension SearchHotplaceResponse {
    // 단일 목데이터
    static let mock = SearchHotplaceResponse(
        placeID: 1,
        name: "경복궁",
        imageURL: "https://picsum.photos/400/300?random=1",
        latitude: 37.5796,
        longitude: 126.9770
    )
    
    // 여러 개의 목데이터 리스트
    static let mockList: [SearchHotplaceResponse] = [
        SearchHotplaceResponse(
            placeID: 1,
            name: "경복궁",
            imageURL: "https://picsum.photos/400/300?random=1",
            latitude: 37.5796,
            longitude: 126.9770
        ),
        SearchHotplaceResponse(
            placeID: 2,
            name: "남산타워",
            imageURL: "https://picsum.photos/400/300?random=2",
            latitude: 37.5512,
            longitude: 126.9882
        ),
        SearchHotplaceResponse(
            placeID: 3,
            name: "한강공원",
            imageURL: "https://picsum.photos/400/300?random=3",
            latitude: 37.5286,
            longitude: 126.9348
        ),
        SearchHotplaceResponse(
            placeID: 4,
            name: "홍대거리",
            imageURL: "https://picsum.photos/400/300?random=4",
            latitude: 37.5563,
            longitude: 126.9236
        ),
        SearchHotplaceResponse(
            placeID: 5,
            name: "북촌한옥마을",
            imageURL: "https://picsum.photos/400/300?random=5",
            latitude: 37.5826,
            longitude: 126.9834
        ),
        SearchHotplaceResponse(
            placeID: 6,
            name: "명동거리",
            imageURL: "https://picsum.photos/400/300?random=6",
            latitude: 37.5636,
            longitude: 126.9865
        ),
        SearchHotplaceResponse(
            placeID: 7,
            name: "이태원",
            imageURL: "https://picsum.photos/400/300?random=7",
            latitude: 37.5345,
            longitude: 126.9944
        ),
        SearchHotplaceResponse(
            placeID: 8,
            name: "코엑스",
            imageURL: "https://picsum.photos/400/300?random=8",
            latitude: 37.5115,
            longitude: 127.0595
        ),
        SearchHotplaceResponse(
            placeID: 9,
            name: "가로수길",
            imageURL: "https://picsum.photos/400/300?random=9",
            latitude: 37.5201,
            longitude: 127.0230
        ),
        SearchHotplaceResponse(
            placeID: 10,
            name: "여의도 한강공원",
            imageURL: "https://picsum.photos/400/300?random=10",
            latitude: 37.5285,
            longitude: 126.9338
        )
    ]
}
