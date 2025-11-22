//
//  SearchService.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 어재선 on 11/23/25.
//

import Foundation
import Moya

final class SearchService {
    
    private let provider = MoyaProvider<SearchAPI>()
    
    
    func getHotplace() async throws -> SearchHotplaceResponse {
        do {
            let response = try await provider.request(.getHotplace)
            print("성공")
            return try response.map(SearchHotplaceResponse.self)
            
        } catch {
            print("⚠️ API 에러 발생: \(error.localizedDescription)")
            return SearchHotplaceResponse.mockData
        }
    }
    
}

