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
    private var menuCategory: MenuCategory?
    private var isTouchedUpInside: Bool = false

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureHierarchy()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Methods

    private func configureHierarchy() {
        button.configureUI(
            tintColor: .black,
            cornerRadius: 10,
            borderWidth: 2,
            borderColor: UIColor.Custom.mainBorderColor?.cgColor,
            backgroundColor: UIColor.Custom.cellColor 
        )
    }

        contentView.addSubview(button)

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    func set(title: String, image: UIImage?, category: MenuCategory) {
        button.setTitle(title)
        button.setImage(image?.resize(newWidth: frame.width * 0.5))
        menuCategory = category
    }

    func toggleUI() {
        isTouchedUpInside.toggle()

        switch isTouchedUpInside {
        case true:
            UIView.animate(withDuration: 0.3) { [weak self] in
            }
        case false:
            UIView.animate(withDuration: 0.3) { [weak self] in
            }
            button.layer.borderColor = UIColor.Custom.mainGoldenrodColor?.cgColor
            button.backgroundColor = UIColor.Custom.mainOrangeColor
            button.changeLabelColor(.white)
            button.layer.borderColor = UIColor.Custom.mainBorderColor?.cgColor
            button.backgroundColor = UIColor.Custom.cellColor
            button.changeLabelColor(UIColor.Custom.soldOutTextColor)
        }
    }

    func settingsCellDidToggle() -> Bool {
        return isTouchedUpInside
    }

    func extractCategoryOfCell() -> MenuCategory {
        return menuCategory ?? .dummy
    }
}
