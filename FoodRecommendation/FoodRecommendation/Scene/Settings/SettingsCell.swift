//
//  SettingsCell.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit



final class SettingsCell: UICollectionViewCell {

    // MARK: Properties

    private let button = SettingsCellButton()
    private var isTouchedUpInside: Bool = false

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        button.configureUI(
            tintColor: .black,
            cornerRadius: 10,
            borderWidth: 2,
            borderColor: UIColor.green.cgColor,
            backgroundColor: .systemBlue
        )
        configureHierarchy()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Methods

    private func configureHierarchy() {
        contentView.addSubview(button)

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    func set(title: String, image: UIImage?) {
        button.setTitle(title)
        button.setImage(image?.resize(newWidth: frame.width * 0.5))
    }

    func toggleUI() {
        isTouchedUpInside.toggle()

        switch isTouchedUpInside {
        case true:
            button.layer.borderColor = UIColor.red.cgColor
            button.backgroundColor = .brown
            button.changeLabelColor(.white)
        case false:
            button.layer.borderColor = UIColor.green.cgColor
            button.backgroundColor = .systemBlue
            button.changeLabelColor(.black)
        }
    }
}
