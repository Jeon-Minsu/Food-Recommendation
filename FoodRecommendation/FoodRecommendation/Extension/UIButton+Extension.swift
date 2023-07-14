//
//  UIButton+Extension.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/14.
//

import UIKit

extension UIButton {
    func configureUI(title: String, state: UIControl.State = .normal, backgroundColor: UIColor = .systemBackground, cornerRadius: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: state)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
    }
}
