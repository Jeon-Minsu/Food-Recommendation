//
//  UICollectionViewCompositionalLayout+Extension.swift
//  Momozi
//
//  Created by 전민수 on 2023/08/17.
//

import UIKit

extension UICollectionViewCompositionalLayout {
    func register<T: UICollectionReusableView>(viewType: T.Type) {
        register(viewType.self, forDecorationViewOfKind: viewType.identifier)
    }
}
