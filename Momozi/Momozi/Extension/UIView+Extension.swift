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

    func setGradientBackground(startColor: UIColor?, endColor: UIColor?, patternImage: UIImage? = nil) {
        guard let startColor = startColor, let endColor = endColor else {
            backgroundColor = .systemBackground
            return
        }

        let gradientColors = [startColor.cgColor, endColor.cgColor]
        let gradientLocations: [NSNumber] = [0.0, 1.0]
        let startPoint = CGPoint(x: 0.5, y: 0.0)
        let endPoint = CGPoint(x: 0.5, y: 1.0)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at: 0)

        guard let patternImage = patternImage else {
            return
        }

        let patternImageView = UIImageView(image: patternImage)
        patternImageView.contentMode = .scaleAspectFill
        patternImageView.frame = bounds

        addSubview(patternImageView)
    }
}
