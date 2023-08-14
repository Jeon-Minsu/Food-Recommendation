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
    private let imageView = UIImageView()
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
        setupDetailViews()
    }

    private func createDetailViews() {
        stackView.configureUI(axis: .horizontal, alignment: .center, distribution: .fill, spacing: 8)
        checkBoxImageView.configureUI(image: UIImage(systemName: "circle.fill"), isSizeNeedToFit: true)
        checkBoxImageView.tintColor = UIColor(named: "mainBorderColor")
        imageView.configureUI(image: nil, isSizeNeedToFit: true)
        titleLabel.configureUI(text: "", textAlignment: .left, font: .systemFont(ofSize: 15))
    }

    private func addDetailViews() {
        addSubview(stackView)
        [checkBoxImageView, imageView, titleLabel].forEach {
            stackView.addArrangedSubview($0)
        }
    }

    private func setupDetailViews() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),

            checkBoxImageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.5),
            checkBoxImageView.widthAnchor.constraint(equalTo: checkBoxImageView.heightAnchor),

            imageView.heightAnchor.constraint(equalTo: checkBoxImageView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: checkBoxImageView.heightAnchor)
        ])
    }

    func setTitle(_ title: String?) {
        titleLabel.text = title
    }

    }

    func toggleUI() {
        isSelected.toggle()

        switch isSelected {
        case true:
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.backgroundColor = UIColor(named: "mainGoldenrodColor")
                self?.setCheckBoxImage(UIImage(named: "checkedBox"))
            }
        case false:
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.backgroundColor = .white
                self?.setCheckBoxImage(UIImage(systemName: "circle.fill"))
            }
        }
    }

    private func setCheckBoxImage(_ image: UIImage?) {
        checkBoxImageView.image = image
    }

    func buttonDidToggle() -> Bool {
        return isSelected
    }
}
