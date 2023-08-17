//
//  SettingsCellButton.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit

final class SettingsCellButton: UIView {

    // MARK: Properties

    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let label = UILabel()

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
        createImageView()
        createLabel()
    }

    private func createStackView() {
        stackView.configureUI(
            axis: .vertical,
            alignment: .center,
            distribution: .fillProportionally
        )
    }

    private func createImageView() {
        imageView.configureUI(contentMode: .scaleAspectFit)
    }

    private func createLabel() {
        label.configureUI(
            textColor: UIColor.Custom.soldOutTextColor,
            textAlignment: .center,
            font: .systemFont(ofSize: 13)
        )
    }

    private func addDetailViews() {
        addSubview(stackView)
        [imageView, label].forEach { stackView.addArrangedSubview($0) }
    }

    private func setupDetailViewsUI() {
        setupStackViewUI()
    }

    private func setupStackViewUI() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3)
        ])
    }

    func setTitle(_ title: String?) {
        label.text = title
    }

    func setImage(_ image: UIImage?) {
        imageView.image = image
    }

    func changeLabelColor(_ color: UIColor?) {
        label.textColor = color
    }
}
