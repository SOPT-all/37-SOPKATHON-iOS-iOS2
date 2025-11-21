//
//  UIView+.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/22/25.
//


import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}