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
        configureDetailUI()
    }

    private func configureDetailUI() {
        createDetailViews()
        addDetailViews()
        setupDetailViewsUI()
        showCautionMessageIfNeeded(shouldShow: false)
    }

    private func createDetailViews() {
        crateTitleLabel()
        createCautionImageView()
        createCautionLabel()
    }

    private func crateTitleLabel() {
        titleLabel.configureUI(textColor: .black, font: .systemFont(ofSize: 24, weight: .bold))
    }

    private func createCautionImageView() {
        cautionImageView.configureUI(
            image: UIImage.Custom.cautionImage?.resize(newWidth: 10),
            contentMode: .scaleAspectFill
        )
    }

    private func createCautionLabel() {
        cautionLabel.configureUI(
            text: "실제와 다를 수 있으니 알러지 음식 섭취는 주의해주세요!",
            textColor: UIColor.Custom.cautionTextColor,
            font: .systemFont(ofSize: 10)
        )
    }

    private func addDetailViews() {
        [titleLabel, cautionImageView, cautionLabel].forEach { addSubview($0) }
    }

    private func setupDetailViewsUI() {
        setupTitleLabelUI()
        setupCautionImageViewUI()
        setupCautionLabelUI()
    }

    private func setupTitleLabelUI() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupCautionImageViewUI() {
        NSLayoutConstraint.activate([
            cautionImageView.topAnchor.constraint(equalTo: cautionLabel.topAnchor),
            cautionImageView.leadingAnchor.constraint(
                equalTo: titleLabel.trailingAnchor,
                constant: 15
            ),
            cautionImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])
    }

    private func setupCautionLabelUI() {
        NSLayoutConstraint.activate([
            cautionLabel.leadingAnchor.constraint(
                equalTo: cautionImageView.trailingAnchor,
                constant: 5
            ),
            cautionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])
    }

    func showCautionMessageIfNeeded(shouldShow: Bool) {
        [cautionImageView, cautionLabel].forEach { $0.isHidden = !shouldShow }
    }

    func set(title: String, cautionImage: UIImage? = nil, cautionText: String? = nil) {
        titleLabel.text = title
    }
}
