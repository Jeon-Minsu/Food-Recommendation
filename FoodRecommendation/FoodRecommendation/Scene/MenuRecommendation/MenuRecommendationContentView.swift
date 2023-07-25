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

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configureUI()
    }

    // MARK: - Methods

    private func configureUI() {
        contentView.configureUI(backgroundColor: .white)
    private func createSpeechBubbleImageView() {
        speechBubbleImageView.configureUI(image: UIImage(named: "momoziSpeechBubble"), contentMode: .scaleAspectFill)
    }
        descriptionLabel.configureUI(text: "모모찌가 딱 정했어!", textAlignment: .center)
        menuLabel.configureUI(text: "음식 이름", textAlignment: .center, font: .preferredFont(forTextStyle: .largeTitle))

        addSubview(contentView)
        [descriptionLabel, menuLabel].forEach { contentView.addSubview($0)}

        setupContentViewUI()
        setupDescriptionLabelUI()
        setupMenuLabelUI()
    }

    private func setupContentViewUI() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    private func setupSpeechBubbleImageViewUI() {
        NSLayoutConstraint.activate([
            speechBubbleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
            speechBubbleImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.475),
            speechBubbleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            speechBubbleImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    }

    private func setupDescriptionLabelUI() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    private func setupMenuLabelUI() {
        NSLayoutConstraint.activate([
            menuLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            menuLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            menuLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    func performAnimation(_ isAnimationNeeded: Bool) {
        if isAnimationNeeded {
            alpha = 0.0
            UIView.animate(withDuration: 0.8) { [weak self] in
                self?.alpha = 1.0
            }
        }
    }
}
