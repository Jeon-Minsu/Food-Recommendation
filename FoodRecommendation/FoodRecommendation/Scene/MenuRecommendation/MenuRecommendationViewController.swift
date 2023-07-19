//
//  MenuRecommendationViewController.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/18.
//

import Koloda

final class MenuRecommendationViewController: UIViewController {

    // MARK: Properties

    private let logoImageView = UIImageView()
    private let menuRecommendationView = KolodaView()
    private let soldOutImageView = UIImageView()
    private let hateMenuButton = UIButton()
    private let descriptionLabel = UILabel()
    private let likeMenuButton = UIButton()
    private let backButton = UIButton()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        addActionForButtonEvent()
    }

    // MARK: - Methods

    private func configureHierarchy() {
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
        // delegate 함수로 빼기 + SettingsViewController도!
        menuRecommendationView.delegate = self
        menuRecommendationView.dataSource = self
        configureUI()
    }

    private func configureUI() {
        logoImageView.configureUI(image: UIImage(systemName: "star.fill"))

        menuRecommendationView.visibleCardsDirection = .top
        menuRecommendationView.backgroundCardsTopMargin = 10
        menuRecommendationView.configureUI()

        soldOutImageView.configureUI(image: UIImage(systemName: "star.fill"), alpha: 0)

        hateMenuButton.configureUI(title: "싫어..", tintColor: .systemGreen)
        hateMenuButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        hateMenuButton.imageEdgeInsets.left = -10

        descriptionLabel.configureUI(text: "옆으로 밀어서 넘기기", textAlignment: .center)

        likeMenuButton.configureUI(title: "좋아!", tintColor: .systemOrange)
        likeMenuButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        likeMenuButton.imageEdgeInsets.right = -10
        likeMenuButton.semanticContentAttribute = .forceRightToLeft

        backButton.configureUI(title: "처음으로", titleColor: .white, backgroundColor: .systemGreen, cornerRadius: 10)

        [logoImageView, menuRecommendationView, soldOutImageView, hateMenuButton, descriptionLabel, likeMenuButton, backButton].forEach { view.addSubview($0) }

        setupLogoImageViewUI()
        setupMenuRecommendationView()
        setupSoldOutImageView()
        setupHateMenuButton()
        setupDescriptionLabel()
        setupLikeMenuButton()
        setupBackButton()
    }

    private func setupLogoImageViewUI() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupMenuRecommendationView() {
        NSLayoutConstraint.activate([
            menuRecommendationView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            menuRecommendationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menuRecommendationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func setupSoldOutImageView() {
        NSLayoutConstraint.activate([
            soldOutImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            soldOutImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350),
            soldOutImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            soldOutImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80)
        ])
    }
    private func setupHateMenuButton() {
        NSLayoutConstraint.activate([
            hateMenuButton.topAnchor.constraint(equalTo: menuRecommendationView.bottomAnchor, constant: 40),
            hateMenuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])

        hateMenuButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    private func setupDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: hateMenuButton.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: hateMenuButton.trailingAnchor, constant: 20)
        ])
    }
    private func setupLikeMenuButton() {
        NSLayoutConstraint.activate([
            likeMenuButton.topAnchor.constraint(equalTo: menuRecommendationView.bottomAnchor, constant: 40),
            likeMenuButton.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 20),
            likeMenuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        likeMenuButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    private func setupBackButton() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: hateMenuButton.bottomAnchor, constant: 40),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120)
        ])
    }

    private func presentMenuResultViewController() {
        navigationController?.pushViewController(UIViewController(), animated: false)
    }

    private func addActionForButtonEvent() {
        addActionForHateMenuButton()
        addActionForLikeMenuButton()
        addActionForBackButton()
    }

    private func addActionForHateMenuButton() {
        hateMenuButton.addAction(
            UIAction { [weak self] _ in
                self?.menuRecommendationView.swipe(.left)
            },
            for: .allEvents
        )
    }

    private func addActionForLikeMenuButton() {
        likeMenuButton.addAction(
            UIAction { [weak self] _ in
                self?.menuRecommendationView.swipe(.right)
            },
            for: .allEvents
        )
    }

    private func addActionForBackButton() {
        backButton.addAction(
            UIAction { [weak self] _ in
                self?.backButton.backgroundColor = .green
            },
            for: .touchDown
        )
        backButton.addAction(
            UIAction { [weak self] _ in
                self?.backButton.backgroundColor = .systemGreen
                self?.navigationController?.popViewController(animated: true)
            },
            for: [.touchUpOutside, .touchUpInside]
        )
    }
}

// MARK: - Extensions

extension MenuRecommendationViewController: KolodaViewDataSource {
    func koloda(_ koloda: Koloda.KolodaView, viewForCardAt index: Int) -> UIView {
        let view = MenuRecommendationContentView()
        view.backgroundColor = returnRainbowColor(index)
        view.layer.cornerRadius = 10

        if index == 0 {
            view.performAnimation(false)
        } else {
            view.performAnimation(true)
        }

        return view
    }

    func kolodaNumberOfCards(_ koloda: Koloda.KolodaView) -> Int {
        return 10
    }

    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        UIView.animate(withDuration: 0.8) { [weak self] in
            self?.soldOutImageView.alpha = 1.0
        }
    }
}

extension MenuRecommendationViewController: KolodaViewDelegate {
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        if direction == .right {
            presentMenuResultViewController()
        }
    }
}
    }
}
