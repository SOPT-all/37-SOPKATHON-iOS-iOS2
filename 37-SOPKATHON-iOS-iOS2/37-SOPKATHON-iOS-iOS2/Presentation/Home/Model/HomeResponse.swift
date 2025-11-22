//
//  HomeModel.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 정윤아 on 11/23/25.
//

import Foundation

// MARK: - Welcome
struct Home: Codable {
    let articleID: Int
    let title: String
    let imageURL: String
    let link: String

    enum Home: String, CodingKey {
        case articleID = "articleId"
        case title
        case imageURL = "imageUrl"
        case link
    }
}

let mockHomes: [Home] = [
    Home(
        articleID: 1,
        title: "40대 서퍼를 위한 피부 노화 방지 꿀팁",
        imageURL: "https://s3.bucket.com/images/article_thumbnail_1.jpg",
        link: "https://surfing-magazine.com/articles/123"
    ),
    Home(
        articleID: 2,
        title: "뜨거운 자외선! 피부암 막는 생활 습관 5가지",
        imageURL: "https://s3.bucket.com/images/article_thumbnail_2.jpg",
        link: "https://health-magazine.com/articles/987"
    ),
    Home(
        articleID: 3,
        title: "바다로 떠나는 서퍼를 위한 피부 보호 루틴",
        imageURL: "https://s3.bucket.com/images/article_thumbnail_3.jpg",
        link: "https://surfing-guide.com/articles/456"
    ),
    Home(
        articleID: 4,
        title: "여름 대비! 자외선 차단제 제대로 고르는 법",
        imageURL: "https://s3.bucket.com/images/article_thumbnail_4.jpg",
        link: "https://beauty-magazine.com/articles/778"
    )
]
