//
//  PreferenceDeclarationButton+Extension.swift
//  Momozi
//
//  Created by 전민수 on 2023/08/14.
//

import UIKit

extension PreferenceDeclarationButton {
    func configureUI(text: String, image: UIImage? = nil, tintColor: UIColor? = nil, cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: CGColor? = nil, backgroundColor: UIColor? = nil) {
        self.setTitle(text)
        self.setImage(image)
        showImageIfNeeded(shouldShow: image != nil)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tintColor = tintColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.backgroundColor = backgroundColor
    }
}
