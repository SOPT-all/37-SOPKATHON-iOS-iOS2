//
//  ReuseIdentifiable.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 안치욱 on 11/22/25.
//


import Foundation

/// CollectionView나 TableView에서 identifier 사용할 때 ~.reuseIdentifier라고 쓰면 사용 가능.
protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String { String(describing: Self.self) }
}
