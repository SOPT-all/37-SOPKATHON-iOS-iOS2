//
//  MoyaProvider.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 어재선 on 11/23/25.
//

import Moya

extension MoyaProvider {
    func request(_ target: Target) async throws -> Response {
        return try await withCheckedThrowingContinuation { continuation in
            self.request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
