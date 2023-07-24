//
//  SelectedMenuViewController.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/19.
//

import UIKit

final class SelectedMenuViewController: UIViewController {

    // MARK: Properties

    private let speechBubbleImageView = UIImageView()
    private let menuDescriptionStackView = UIStackView()
    private let firstDescriptionLabel = UILabel()
    private let menuLabel = UILabel()
    private let secondDescriptionLabel = UILabel()
    private let characterImageView = UIImageView()
    private let homeButton = UIButton()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        addActionForButtonEvent()
    }

    // MARK: - Methods

    private func configureHierarchy() {
        view.backgroundColor = .systemBackground
        navigationItem.titleView = UIImageView(image: UIImage(systemName: "star.fill"))

        configureUI()
    }

    private func configureUI() {
        menuDescriptionStackView.configureUI(axis: .vertical, alignment: .fill, distribution: .equalSpacing)
        firstDescriptionLabel.configureUI(text: "오늘 \(getEatingTimePhrase()) 메뉴는", textAlignment: .left)
        menuLabel.configureUI(text: "새우 초밥", textAlignment: .center, font: .preferredFont(forTextStyle: .largeTitle))
        secondDescriptionLabel.configureUI(text: "이 좋겠군...", textAlignment: .right)
        homeButton.configureUI(title: "처음으로", titleColor: .white, backgroundColor: .systemGreen, cornerRadius: 10)
    private func setupNavigationBackButtonUI() {
        let backButtonImage = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold))
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = UIColor(named: "mainGreenColor")
        navigationItem.leftBarButtonItem = backButton
    }

        [menuDescriptionStackView, homeButton].forEach { view.addSubview($0) }
    @objc private func backButtonTapped(_ gesture: UITapGestureRecognizer) {
        popToPreviousViewController()
    }

        [firstDescriptionLabel, menuLabel, secondDescriptionLabel].forEach { menuDescriptionStackView.addArrangedSubview($0) }
    private func popToPreviousViewController() {
        navigationController?.popViewController(animated: true)
    }

        setupmenuDescriptionStackViewUI()
        setupHomeButtonUI()
        speechBubbleImageView.configureUI(image: UIImage(named: "speechBubble"), contentMode: .scaleAspectFill)
        menuDescriptionStackView.configureUI(axis: .vertical, alignment: .fill, distribution: .equalSpacing, layoutMargins: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        firstDescriptionLabel.configureUI(text: "오늘 \(getEatingTimePhrase()) 메뉴는", textAlignment: .left, font: UIFont(name: "Makgeolli", size: 20))
        menuLabel.configureUI(text: "새우 초밥", textColor: UIColor(named: "selectedMenuTextColor"), textAlignment: .center, font: .systemFont(ofSize: 25, weight: .bold))
        secondDescriptionLabel.configureUI(text: "이 좋겠군...", textAlignment: .right, font: UIFont(name: "Makgeolli", size: 20))
        characterImageView.configureUI(image: UIImage(named: "wasabisanImage"), contentMode: .scaleAspectFill)
        homeButton.configureUI(title: "처음으로", font: .systemFont(ofSize: 23, weight: .bold),  titleColor: .white, backgroundColor: UIColor(named: "mainGreenColor"), cornerRadius: 10)
    }

    private func getEatingTimePhrase() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)

        switch hour {
        case 6..<10:
            return "아침"
        case 12..<15:
            return "점심"
        case 17..<21:
            return "저녁"
        case 21..<24, 0..<3:
            return "야식"
        default:
            return "간식"
        }
    }

    private func setupmenuDescriptionStackViewUI() {
        setupSpeechBubbleImageViewUI()
        setupMenuDescriptionStackViewUI()
        setupCharacterImageViewUI()
        setupHomeButtonUI()
    private func setupSpeechBubbleImageViewUI() {
        NSLayoutConstraint.activate([
            speechBubbleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.125),
            speechBubbleImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            speechBubbleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            speechBubbleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }

    private func setupMenuDescriptionStackViewUI() {
        NSLayoutConstraint.activate([
            menuDescriptionStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.16),
            menuDescriptionStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            menuDescriptionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            menuDescriptionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }

    private func setupCharacterImageViewUI() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: speechBubbleImageView.bottomAnchor, constant: 15),
            characterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
    }

    private func setupHomeButtonUI() {
        NSLayoutConstraint.activate([
            homeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height * 0.075),
            homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4)
        ])
    }

    private func addActionForButtonEvent() {
        addActionForHomeButton()
    }

    private func addActionForHomeButton() {
        homeButton.addAction(
            UIAction { [weak self] _ in
                self?.homeButton.backgroundColor = .green
            },
            for: .touchDown
        )
        homeButton.addAction(
            UIAction { [weak self] _ in
                self?.homeButton.backgroundColor = .systemGreen
                self?.popToFirstViewController()
            },
            for: [.touchUpOutside, .touchUpInside]
        )
    }

    private func popToFirstViewController() {
        if let firstViewController = navigationController?.viewControllers.first {
            navigationController?.popToViewController(firstViewController, animated: true)
        }
    }
}
