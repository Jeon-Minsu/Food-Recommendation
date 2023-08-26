//
//  UINavigationBar+Extension.swift
//  Momozi
//
//  Created by 전민수 on 2023/08/26.
//

import UIKit

extension UINavigationBar {
    func makeTransparent() {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = true
    }
}
