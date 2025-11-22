
//
//  CardType.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/23/25.
//

import UIKit

enum CardType: CaseIterable {
    case good
    case normal
    case high
    case extraHigh
    case danger
    
    init(level: Double) {
        switch level {
        case 0..<2:
            self = .good
        case 3..<5:
            self = .normal
        case 6..<7:
            self = .high
        case 8..<10:
            self = .extraHigh
        default:
            self = .danger
        }
    }
}

extension CardType {
    var title: String {
        "현재 자외선 지수"
    }
    
    var subtitle: String {
        switch self {
        case .good:
            return "날씨가 도와주는 날이네요!\n지금 당장 어디로든 떠나보세요"
        case .normal:
            return "바다로 뛰어들 준비 완료!\n서핑하기 좋은 날이네요"
        case .high:
            return "선크림 바르고\n낭만있게 캠핑을 떠나보세요!"
        case .extraHigh:
            return "잠깐, 태양의 힘이 너무 강해요!\n시원한 그늘에서 가벼운 산책은 어떤가요?"
        case .danger:
            return "위험 수준의 자외선입니다!\n야외 활동 대신 실내에서 여유를 즐겨보세요"
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .good:
            return .primary200
        case .normal:
            return .primary100
        case .high:
            return .suntaGreen
        case .extraHigh:
            return .secondary100
        case .danger:
            return .secondary300
        }
    }
}
