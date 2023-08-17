//
//  UIFont+Extension.swift
//  Momozi
//
//  Created by 전민수 on 2023/08/17.
//

import UIKit

extension UIFont {
    enum Custom {
        static func menuDescription(size: CGFloat) -> UIFont? {
            return UIFont(name: "MaplestoryOTFLight", size: size)
        }
        static func selectedMenuDescription(size: CGFloat) -> UIFont? {
            return UIFont(name: "Makgeolli", size: size)
        }
    }
}
