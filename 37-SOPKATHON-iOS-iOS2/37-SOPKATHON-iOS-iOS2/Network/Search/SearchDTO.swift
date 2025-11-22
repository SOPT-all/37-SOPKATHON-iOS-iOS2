//
//  SearchDTO.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 어재선 on 11/23/25.
//

import Foundation

// MARK: - SearchHotplaceResponse
struct SearchHotplaceResponse: Codable {
    let status: Int
    let message: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let placeID: Int
    let name, imageURL: String
    let latitude, longitude: Double

    enum CodingKeys: String, CodingKey {
        case placeID = "placeId"
        case name
        case imageURL = "imageUrl"
        case latitude, longitude
    }
}

// MARK: - Mock Data
extension SearchHotplaceResponse {
    static let mockData = SearchHotplaceResponse(
        status: 200,
        message: "핫플레이스 검색 성공",
        data: [
            Datum(
                placeID: 1,
                name: "경복궁",
                imageURL: "https://picsum.photos/400/300?random=1",
                latitude: 37,
                longitude: 126
            ),
            Datum(
                placeID: 2,
                name: "남산타워",
                imageURL: "https://picsum.photos/400/300?random=2",
                latitude: 37,
                longitude: 126
            ),
            Datum(
                placeID: 3,
                name: "여의도 한강공원",
                imageURL: "https://picsum.photos/400/300?random=3",
                latitude: 37,
                longitude: 126
            ),
            Datum(
                placeID: 4,
                name: "북촌한옥마을",
                imageURL: "https://picsum.photos/400/300?random=4",
                latitude: 37,
                longitude: 126
            ),
            Datum(
                placeID: 5,
                name: "홍대거리",
                imageURL: "https://picsum.photos/400/300?random=5",
                latitude: 37,
                longitude: 126
            ),
            Datum(
                placeID: 6,
                name: "명동거리",
                imageURL: "https://picsum.photos/400/300?random=6",
                latitude: 37,
                longitude: 126
            ),
            Datum(
                placeID: 7,
                name: "DDP(동대문디자인플라자)",
                imageURL: "https://picsum.photos/400/300?random=7",
                latitude: 37,
                longitude: 127
            ),
            Datum(
                placeID: 8,
                name: "성수동 카페거리",
                imageURL: "https://picsum.photos/400/300?random=8",
                latitude: 37,
                longitude: 127
            ),
            Datum(
                placeID: 9,
                name: "익선동 한옥거리",
                imageURL: "https://picsum.photos/400/300?random=9",
                latitude: 37,
                longitude: 126
            ),
            Datum(
                placeID: 10,
                name: "서울숲",
                imageURL: "https://picsum.photos/400/300?random=10",
                latitude: 37,
                longitude: 127
            ),
            Datum(
                placeID: 11,
                name: "코엑스",
                imageURL: "https://picsum.photos/400/300?random=11",
                latitude: 37,
                longitude: 127
            ),
            Datum(
                placeID: 12,
                name: "가로수길",
                imageURL: "https://picsum.photos/400/300?random=12",
                latitude: 37,
                longitude: 127
            ),
            Datum(
                placeID: 13,
                name: "이태원",
                imageURL: "https://picsum.photos/400/300?random=13",
                latitude: 37,
                longitude: 126
            ),
            Datum(
                placeID: 14,
                name: "광화문광장",
                imageURL: "https://picsum.photos/400/300?random=14",
                latitude: 37,
                longitude: 126
            ),
            Datum(
                placeID: 15,
                name: "삼청동",
                imageURL: "https://picsum.photos/400/300?random=15",
                latitude: 37,
                longitude: 126
            )
        ]
    )
}
