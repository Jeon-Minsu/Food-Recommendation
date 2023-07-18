//
//  VeganDeclarationButton.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit

final class VeganDeclarationButton: UIView {

    // MARK: Properties

    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let label = UILabel()
    private var isSelected: Bool = false

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
        stackView.configureUI(axis: .horizontal, alignment: .center, distribution: .fill, spacing: 8)
        imageView.configureUI(image: UIImage(systemName: "eraser"), isSizeNeedToFit: true)
        label.configureUI(text: "비건이에요", textAlignment: .center)
    }

    private func configureHierarchy() {
        addSubview(stackView)

        [imageView, label].forEach {
            stackView.addArrangedSubview($0)
        }

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor),

            imageView.heightAnchor.constraint(equalTo: label.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }

    func setTitle(_ title: String?) {
        label.text = title
    }

    func setImage(_ image: UIImage?) {
        imageView.image = image
    }

    func toggleUI() {
        isSelected.toggle()
        print(isSelected)

        switch isSelected {
        case true:
            setImage(UIImage(systemName: "pencil"))
        case false:
            setImage(UIImage(systemName: "eraser"))
        }
    }
}
