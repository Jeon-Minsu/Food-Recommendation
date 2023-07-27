//
//  UILabel+Extension.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/14.
//

import UIKit

extension UILabel {
    func configureUI(text: String = "", textColor: UIColor? = .black, textAlignment: NSTextAlignment = .left, font: UIFont? = .preferredFont(forTextStyle: .body), numberOfLines: Int = 1, alpha: CGFloat = 1) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = font
        self.numberOfLines = numberOfLines
        self.alpha = alpha
    }
}
