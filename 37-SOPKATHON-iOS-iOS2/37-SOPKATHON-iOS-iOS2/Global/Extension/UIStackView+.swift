//
//  UIStackView+.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/22/25.
//


import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
