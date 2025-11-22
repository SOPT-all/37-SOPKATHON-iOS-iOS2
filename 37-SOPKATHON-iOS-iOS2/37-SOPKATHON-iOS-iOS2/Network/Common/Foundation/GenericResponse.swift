//
//  GenericResponse.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/22/25.
//

import Foundation

struct GenericResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: String
}
