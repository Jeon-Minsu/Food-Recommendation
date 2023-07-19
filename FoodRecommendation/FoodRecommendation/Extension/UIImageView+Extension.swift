//
//  UIImageView+Extension.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/14.
//

import UIKit

extension UIImageView {
    func configureUI(image: UIImage? = nil, alpha: CGFloat = 1, isSizeNeedToFit: Bool = false) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = alpha
        self.image = image

        if isSizeNeedToFit {
            self.sizeToFit()
        }
    }
}
