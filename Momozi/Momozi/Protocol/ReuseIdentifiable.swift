//
//  ReuseIdentifiable.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit

protocol ReuseIdentifiable {
    static var identifier: String { get }
}

extension ReuseIdentifiable {
    static var identifier: String {
        return String(describing: Self.self)
    }
}

extension UICollectionReusableView: ReuseIdentifiable {}
