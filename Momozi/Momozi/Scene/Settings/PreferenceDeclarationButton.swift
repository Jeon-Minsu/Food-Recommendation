//
//  PreferenceDeclarationButton.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit

final class PreferenceDeclarationButton: UIView {

    // MARK: Properties

    private let stackView = UIStackView()
    private let checkBoxImageView = UIImageView()
    private let additionalImageView = UIImageView()
    private let titleLabel = UILabel()
    private var isSelected: Bool = false

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
    }

    private func createDetailViews() {
        createStackView()
        createCheckBoxImageView()
        createAdditionalImageView()
        createTitleLabel()
    }

    private func createStackView() {
        stackView.configureUI(
            axis: .horizontal,
            alignment: .center,
            distribution: .fill,
            spacing: 8
        )
    }

    private func createCheckBoxImageView() {
        checkBoxImageView.configureUI(
            image: UIImage(systemName: "circle.fill"),
            isSizeNeedToFit: true
        )
        checkBoxImageView.tintColor = UIColor.Custom.mainBorderColor
    }

    private func createAdditionalImageView() {
        additionalImageView.configureUI(image: nil, isSizeNeedToFit: true)
    }

    private func createTitleLabel() {
        titleLabel.configureUI(text: "", textAlignment: .left, font: .systemFont(ofSize: 15))
    }


    private func addDetailViews() {
        addSubview(stackView)
        [checkBoxImageView, additionalImageView, titleLabel].forEach { stackView.addArrangedSubview($0) }
    }

    private func setupDetailViewsUI() {
        setupStackViewUI()
        setupCheckBoxImageViewUI()
        setupAdditionalImageViewUI()
    }

    private func setupStackViewUI() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
        ])
    }

    private func setupCheckBoxImageViewUI() {
        NSLayoutConstraint.activate([
            checkBoxImageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.5),
            checkBoxImageView.widthAnchor.constraint(equalTo: checkBoxImageView.heightAnchor),
        ])
    }

    private func setupAdditionalImageViewUI() {
        NSLayoutConstraint.activate([
            additionalImageView.heightAnchor.constraint(equalTo: checkBoxImageView.heightAnchor),
            additionalImageView.widthAnchor.constraint(equalTo: checkBoxImageView.heightAnchor)
        ])
    }

    func setTitle(_ title: String?) {
        titleLabel.text = title
    }

    func setImage(_ image: UIImage?) {
        additionalImageView.image = image
    }

    func showImageIfNeeded(shouldShow: Bool) {
        additionalImageView.isHidden = !shouldShow
    }

    func toggleUI() {
        isSelected.toggle()
        UIView.animate(withDuration: 0.3) { [weak self] in self?.updateUI() }
    }

    private func updateUI() {
        if isSelected {
            backgroundColor = UIColor.Custom.mainGoldenrodColor
            setCheckBoxImage(UIImage.Custom.checkedBox)
        } else {
            backgroundColor = .white
            setCheckBoxImage(UIImage(systemName: "circle.fill"))
        }
    }

    private func setCheckBoxImage(_ image: UIImage?) {
        checkBoxImageView.image = image
    }

    func buttonDidToggle() -> Bool {
        return isSelected
    }
}
