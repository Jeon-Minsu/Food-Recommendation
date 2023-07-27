//
//  UIImage+Extension.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/25.
//

import UIKit

extension UIImage {
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / size.width
        let newHeight = size.height * scale
        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            draw(in: CGRect(origin: .zero, size: size))
        }

        return renderImage
    }
}
