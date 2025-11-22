//
//  NSAtrributedString+.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/23/25.
//


import UIKit

extension NSAttributedString {
    static func pretendard(_ style: UIFont.PretendardStyle, text: String) -> NSAttributedString {
        let font = UIFont.pretendard(style)
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineHeightMultiple = 1.5
        paragraph.kern = -0.02
        
        
        return NSAttributedString(string: text, attributes: [
            .font: font,
            .paragraphStyle: paragraph
        ])
    }
}
