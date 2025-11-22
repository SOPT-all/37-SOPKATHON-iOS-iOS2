//
//  HomeModel.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 정윤아 on 11/23/25.
//

struct Home {
    let imageUrl: String
    let link: String
    let title: String
}

let mockDatas: [Home] = [
    .init(
        imageUrl: "https://s3.bucket.com/images/article_thumbnail.jpg",
        link: "https://www.amc.seoul.kr/asan/healthinfo/disease/diseaseDetail.do?contentId=31545",
        title: "40대 서퍼를 위한 피부 노화 방지 꿀팁"
        )
]
