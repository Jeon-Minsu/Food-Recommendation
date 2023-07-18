//
//  UIView+Extension.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/14.
//

import UIKit

extension UIView {
    func configureUI(tintColor: UIColor? = nil, cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: CGColor? = nil, backgroundColor: UIColor? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tintColor = tintColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.backgroundColor = backgroundColor
    }
}
