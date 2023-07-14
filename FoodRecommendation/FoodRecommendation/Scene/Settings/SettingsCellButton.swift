//
//  SettingsCellButton.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit

final class SettingsCellButton: UIView {

    // MARK: Properties

    private let imageView = UIImageView()
    private let label = UILabel()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
        configureHierarchy()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureUI()
        configureHierarchy()
    }

    // MARK: - Methods

    private func configureUI() {
        imageView.configureUI(isSizeNeedToFit: true)
        label.configureUI(
            textColor: .black,
            textAlignment: .center,
            font: UIFont.preferredFont(forTextStyle: .caption1)
        )
    }

    private func configureHierarchy() {
        [imageView, label].forEach {
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),

            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }

    func setTitle(_ title: String?) {
        label.text = title
    }

    func setImage(_ image: UIImage?) {
        imageView.image = image
    }

    func changeLabelColor(_ color: UIColor) {
        label.textColor = color
    }
}
