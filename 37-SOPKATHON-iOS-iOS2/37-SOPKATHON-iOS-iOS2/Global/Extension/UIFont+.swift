//
//  UIFont+.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/23/25.
//


import UIKit

extension UIFont {
    
    enum Family: String, CaseIterable {
        case Black, Bold, ExtraBold, ExtraLight, Light, Medium, Regular, Semibold, Thin
    }
    
    enum PretendardStyle {
        
        case title_eb_56
        
        case head_sb_24
        case head_sb_20
        
        case body_sb_18
        case body_sb_16
        case body_sb_14
        case body_sb_12
        
        case body_m_18
        case body_m_16
        case body_m_14
        case body_m_12
        
        case body_r_12
        case body_r_10
        
    }
    
    static func pretendard(weight: Family = .Regular, size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Pretendard-\(weight.rawValue)", size: size) {
            return font
        } else {
            print("Pretendard-\(weight.rawValue) loading failed, fallback to system font")
            return .systemFont(ofSize: size)
        }
    }
    
    static func pretendard(_ style: PretendardStyle) -> UIFont {
        switch style {
        case .title_eb_56: return .pretendard(weight: .ExtraBold, size: 56)
            
        case .head_sb_24: return .pretendard(weight: .Semibold, size: 24)
        case .head_sb_20: return .pretendard(weight: .Semibold, size: 20)
            
        case .body_sb_18: return .pretendard(weight: .Semibold, size: 18)
        case .body_sb_16: return .pretendard(weight: .Semibold, size: 16)
        case .body_sb_14: return .pretendard(weight: .Semibold, size: 14)
        case .body_sb_12: return .pretendard(weight: .Semibold, size: 12)
            
        case .body_m_18: return .pretendard(weight: .Medium, size: 18)
        case .body_m_16: return .pretendard(weight: .Medium, size: 16)
        case .body_m_14: return .pretendard(weight: .Medium, size: 14)
        case .body_m_12: return .pretendard(weight: .Medium, size: 12)
            
        case .body_r_12: return .pretendard(weight: .Regular, size: 12)
        case .body_r_10: return .pretendard(weight: .Regular, size: 10)
        }
    }
}
