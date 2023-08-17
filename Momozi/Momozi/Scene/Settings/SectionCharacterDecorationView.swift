//
//  SectionCharacterDecorationView.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/26.
//

import UIKit

final class SectionCharacterDecorationView: UICollectionReusableView {

    // MARK: Properties

    static let elementKind = "SectionCharacterDecorationView"
    private let speechBubbleImageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let characterImageView = UIImageView()

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
        createDetailViews()
        addDetailViews()
        setupDetailViews()
    }

    private func createDetailViews() {
        descriptionLabel.configureUI(text: "모모찌는\n단 거 좋아해!", textColor: UIColor(named: "soldOutTextColor"), textAlignment: .center, font: .systemFont(ofSize: 9), numberOfLines: 2)
    private func createSpeechBubbleImageView() {
        speechBubbleImageView.configureUI(
            image: UIImage.Custom.decorationSpeechBubble,
            contentMode: .scaleAspectFit
        )
    }

    private func createCharacterImageView() {
        characterImageView.configureUI(
            image: UIImage.Custom.decorationMomoziImage,
            contentMode: .scaleAspectFit
        )
    }
    private func addDetailViews() {
        [speechBubbleImageView, descriptionLabel, characterImageView].forEach { addSubview($0) }
    }

    private func setupDetailViews() {
        NSLayoutConstraint.activate([
            speechBubbleImageView.trailingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            speechBubbleImageView.widthAnchor.constraint(equalTo: descriptionLabel.widthAnchor, multiplier: 1.5),
            speechBubbleImageView.heightAnchor.constraint(equalTo: speechBubbleImageView.widthAnchor, multiplier: 0.6),
            speechBubbleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),

            descriptionLabel.centerXAnchor.constraint(equalTo: speechBubbleImageView.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: speechBubbleImageView.centerYAnchor),

            characterImageView.widthAnchor.constraint(equalTo: speechBubbleImageView.widthAnchor, multiplier: 1.07),
            characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor, multiplier: 0.65),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -frame.width * 0.08),
            characterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 1.5)
        ])
    }
}

