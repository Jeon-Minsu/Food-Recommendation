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
    private let titleLabel = UILabel()
    private let cautionImageView = UIImageView()
    private let cautionLabel = UILabel()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureHierarchy()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureHierarchy()
    }

    // MARK: - Methods

    private func configureHierarchy() {
        configureUI()
    }

    private func configureUI() {
        titleLabel.configureUI(textColor: .black, font: .systemFont(ofSize: 24, weight: .bold))
        cautionImageView.configureUI(image: UIImage(named: "cautionImage"), contentMode: .scaleAspectFill)
        cautionLabel.configureUI(text: "실제와 다를 수 있으니 알러지 음식 섭취는 주의해주세요!", textColor: UIColor(named: "cautionTextColor"), font: .systemFont(ofSize: 10))

        [titleLabel, cautionImageView, cautionLabel].forEach { addSubview($0) }

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            cautionImageView.topAnchor.constraint(equalTo: cautionLabel.topAnchor),
            cautionImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 15),
            cautionImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])

        NSLayoutConstraint.activate([
            cautionLabel.leadingAnchor.constraint(equalTo: cautionImageView.trailingAnchor, constant: 5),
            cautionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])
    }

    func set(title: String, cautionImage: UIImage? = nil, cautionText: String? = nil) {
        titleLabel.text = title
    }

    func showCautionMessageIfNeeded(shouldShow: Bool) {
        if shouldShow {
            cautionImageView.isHidden = false
            cautionLabel.isHidden = false
        } else {
            cautionImageView.isHidden = true
            cautionLabel.isHidden = true
        }
    }
}
