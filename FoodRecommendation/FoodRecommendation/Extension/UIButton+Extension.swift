//
//  UIButton+Extension.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/14.
//

import UIKit

extension UIButton {
    func configureUI(title: String = "", state: UIControl.State = .normal, font: UIFont? = .preferredFont(forTextStyle: .body), titleColor: UIColor = .black, tintColor: UIColor? = .black, backgroundColor: UIColor? = .clear, cornerRadius: CGFloat = 0, image: UIImage? = nil) {
        guard let backgroundColor = backgroundColor, let tintColor = tintColor else {
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: state)
        self.titleLabel?.font = font
        self.setTitleColor(titleColor, for: .normal)
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.setImage(image, for: .normal)
    }
}
