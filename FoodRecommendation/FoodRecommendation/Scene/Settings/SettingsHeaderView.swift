//
//  SettingsHeaderView.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {

    // MARK: Properties
    
    static let elementKind = "SectionHeaderView"
    private let label = UILabel()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        label.configureUI(textColor: .black, font: .preferredFont(forTextStyle: .title3))
        configureHierarchy()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        label.configureUI(textColor: .black, font: .preferredFont(forTextStyle: .title3))
        configureHierarchy()
    }

    // MARK: - Methods

    private func configureHierarchy() {
        addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }

    func set(title: String) {
        label.text = title
    }
}
