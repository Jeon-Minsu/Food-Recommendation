//
//  UICollectionView+Extension.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        register(cellType.self, forCellWithReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: T.identifier,
            for: indexPath
        ) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(T.identifier) matching Type \(T.self)"
            )
        }

        return cell
    }

    func configureUI(isScrollEnabled: Bool = false, showsHorizontalScrollIndicator: Bool = false, showsVerticalScrollIndicator: Bool = false, backgroundColor: UIColor? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isScrollEnabled = isScrollEnabled
        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        self.backgroundColor = backgroundColor
    }
}
