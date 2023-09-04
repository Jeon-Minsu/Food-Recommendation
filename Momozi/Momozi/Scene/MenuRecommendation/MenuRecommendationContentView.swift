//
//  MenuRecommendationContentView.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/18.
//

import UIKit

final class MenuRecommendationContentView: UIView {

    // MARK: Properties

    private let contentView = UIView()
    private let descriptionLabel = UILabel()
    private let menuLabel = UILabel()
    private let speechBubbleImageView = UIImageView()
    private let characterImageView = UIImageView()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureHierarchy()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configureHierarchy()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupLabelsUI()
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
        createContentView()
        createSpeechBubbleImageView()
        createCharacterImageView()
        createDescriptionLabel()
        createMenuLabel()
    }

    private func createContentView() {
        contentView.configureUI()
        contentView.layer.borderColor = UIColor.Custom.mainTangerineColor?.cgColor
        contentView.layer.borderWidth = 2
    }

    private func createSpeechBubbleImageView() {
        speechBubbleImageView.configureUI(
            image: UIImage.Custom.momoziSpeechBubble,
            contentMode: .scaleAspectFill
        )
    }

    private func createCharacterImageView() {
        characterImageView.configureUI(
            image: UIImage.Custom.momoziImage,
            contentMode: .scaleAspectFill
        )
    }

    private func createDescriptionLabel() {
        descriptionLabel.configureUI(
            text: "모모찌가 딱 정했어!",
            textAlignment: .center,
            font: .systemFont(ofSize: 20)
        )
    }

    private func createMenuLabel() {
        menuLabel.configureUI(
            text: "음식 이름",
            textAlignment: .center,
            font: UIFont.Custom.menuDescription(size: 35)
        )
    }

    private func addDetailViews() {
        addSubview(contentView)
        [
            speechBubbleImageView,
            characterImageView,
            descriptionLabel,
            menuLabel
        ].forEach { contentView.addSubview($0) }
    }

    private func setupDetailViewsUI() {
        setupContentViewUI()
        setupSpeechBubbleImageViewUI()
        setupCharacterImageViewUI()
    }

    private func setupContentViewUI() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
        contentView.clipsToBounds = true
    }

    private func setupSpeechBubbleImageViewUI() {
        NSLayoutConstraint.activate([
            speechBubbleImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: -10
            ),
            speechBubbleImageView.heightAnchor.constraint(
                equalTo: contentView.heightAnchor,
                multiplier: 0.475
            ),
            speechBubbleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            speechBubbleImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func setupCharacterImageViewUI() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: speechBubbleImageView.bottomAnchor),
            characterImageView.heightAnchor.constraint(
                equalTo: contentView.heightAnchor,
                multiplier: 0.85
            ),
            characterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    private func setupLabelsUI() {
        setupDescriptionLabelUI()
        setupMenuLabelUI()
    }

    private func setupDescriptionLabelUI() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height * 0.05),
            descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    private func setupMenuLabelUI() {
        NSLayoutConstraint.activate([
            menuLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: contentView.frame.height * 0.07),
            menuLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    func setGradientBackground() {
        contentView.setGradientBackground(
            startColor: UIColor.Custom.mainGoldenrodColor,
            endColor: UIColor.Custom.mainGradientStartColor
        )
    }

    func performAnimation(upon index: Int) {
        if index != 0 {
            alpha = 0.0
            UIView.animate(withDuration: 0.8) { [weak self] in self?.alpha = 1.0 }
        }
    }
    
    func setMenuTitle(_ title: String) {
        menuLabel.text = title
    }

    func setContentHidden(_ isHidden: Bool) {
        contentView.isHidden = isHidden
    }
}
