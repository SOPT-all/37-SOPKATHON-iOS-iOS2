//
//  UIImageView+.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 홍준범 on 11/23/25.
//

import UIKit

import Kingfisher

extension UIImageView{
    func kfSetImage(url : String?){
        
        guard let url = url else {
            self.image = UIImage(systemName: "person")
            return }
        
        if let url = URL(string: url) {
            kf.indicatorType = .activity
            kf.setImage(with: url,
                        placeholder: nil,
                        options: [.transition(.fade(1.0))], progressBlock: nil)
        }
    }
}
