//
//  UIButton+Extension.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/14.
//

import UIKit

extension UIButton {
    func configureUI(title: String, state: UIControl.State = .normal, titleColor: UIColor = .black, tintColor: UIColor = .black, backgroundColor: UIColor = .systemBackground, cornerRadius: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: state)
        self.setTitleColor(titleColor, for: .normal)
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
    }
}
