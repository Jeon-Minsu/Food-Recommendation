//
//  UIStackView+Extension.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/14.
//

import UIKit

extension UIStackView {
    func configureUI(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat = 0, layoutMargins: UIEdgeInsets? = nil) {
        if let layoutMargins = layoutMargins {
            self.layoutMargins = layoutMargins
            self.isLayoutMarginsRelativeArrangement = true
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
    }
}
