//
//  MenuRecommendationViewController.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/18.
//

import Koloda

final class MenuRecommendationViewController: UIViewController {

    // MARK: Properties

    private let menuRecommendationView = KolodaView()
    private let soldOutPanelImageView = UIImageView()
    private let soldOutCharacterImageView = UIImageView()
    private let hateMenuButton = UIButton()
    private let descriptionLabel = UILabel()
    private let likeMenuButton = UIButton()
    private let homeButton = UIButton()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        addActionForButtonEvent()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setCardGradientBackground()
    }

    // MARK: - Methods

    private func configureHierarchy() {
        view.backgroundColor = .systemBackground
    private func setupNavigationBarUI() {
        let image = UIImage(named: "logo")?.resize(newWidth: view.frame.width * 0.3)
        let logoImageView = UIImageView(image: image)
        navigationItem.titleView = logoImageView
        navigationItem.hidesBackButton = true
        // delegate 함수로 빼기 + SettingsViewController도!
        menuRecommendationView.delegate = self
        menuRecommendationView.dataSource = self
        configureUI()
    }

    private func setupBackgroundUI() {
        let gradientStartColor = UIColor(named: "menuRecommendationGradientStartColor")
        let gradientEndColor = UIColor(named: "menuRecommendationGradientEndColor")
        let backgroundPatternImage = UIImage(named: "backgroundPatternImage")

        menuRecommendationView.visibleCardsDirection = .top
        menuRecommendationView.backgroundCardsTopMargin = 10
        view.setGradientBackground(startColor: gradientStartColor, endColor: gradientEndColor, patternImage: backgroundPatternImage)
    }
        menuRecommendationView.configureUI()
    private func createSoldOutPanelImageView() {
        soldOutPanelImageView.configureUI(image: UIImage(named: "soldOutPanel"), alpha: 0, contentMode: .scaleAspectFit)
    }

    private func createSoldOutCharacterImageView() {
        soldOutCharacterImageView.configureUI(image: UIImage(named: "sadMomoziImage"), alpha: 0, contentMode: .scaleAspectFill)
    }

    private func createHateMenuButton() {
        hateMenuButton.configureUI(
            title: "싫어..",
            font: .preferredFont(forTextStyle: .title3),
            tintColor: UIColor(named: "mainGreenColor"),
            image: UIImage(
                systemName: "chevron.left",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
            ),
            imageEdgeInsets: UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        )
    }

        descriptionLabel.configureUI(text: "옆으로 밀어서 넘기기", textAlignment: .center)

    private func createLikeMenuButton() {
        likeMenuButton.configureUI(
            title: "좋아!",
            font: .preferredFont(forTextStyle: .title3),
            tintColor: UIColor(named: "mainTangerineColor"),
            image: UIImage(
                systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
            ),
            imageEdgeInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -10),
            semanticContentAttribute: .forceRightToLeft
        )
    }

    private func createHomeButton() {
        homeButton.configureUI(
            title: "처음으로",
            font: .systemFont(ofSize: 23, weight: .bold),
            titleColor: .white,
            backgroundColor: UIColor(named: "mainGreenColor"),
            cornerRadius: 10
        )
    }

        [logoImageView, menuRecommendationView, soldOutImageView, hateMenuButton, descriptionLabel, likeMenuButton, homeButton].forEach { view.addSubview($0) }

        setupMenuRecommendationViewUI()
        setupSoldOutImageViewUI()
        setupHateMenuButtonUI()
        setupDescriptionLabelUI()
        setupLikeMenuButtonUI()
        setupHomeButtonUI()
    }

        NSLayoutConstraint.activate([
        ])
    }

    private func setupMenuRecommendationViewUI() {
    private func setupSoldOutPanelImageViewUI() {
        NSLayoutConstraint.activate([
            menuRecommendationView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            menuRecommendationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menuRecommendationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            soldOutPanelImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.185),
            soldOutPanelImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.27),
            soldOutPanelImageView.widthAnchor.constraint(equalTo: soldOutPanelImageView.heightAnchor, multiplier: 1.05),
            soldOutPanelImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupSoldOutCharacterImageViewUI() {
        NSLayoutConstraint.activate([
            soldOutCharacterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.41),
            soldOutCharacterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -40),
            soldOutCharacterImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.625),
            soldOutCharacterImageView.heightAnchor.constraint(equalTo: soldOutCharacterImageView.widthAnchor)
        ])
    }
        ])
    }

    private func setupHateMenuButtonUI() {
        NSLayoutConstraint.activate([
            hateMenuButton.topAnchor.constraint(equalTo: menuRecommendationView.bottomAnchor, constant: 40),
            hateMenuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])

        hateMenuButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    private func setupDescriptionLabelUI() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: hateMenuButton.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: hateMenuButton.trailingAnchor, constant: 20)
        ])
    }

    private func setupLikeMenuButtonUI() {
        NSLayoutConstraint.activate([
            likeMenuButton.topAnchor.constraint(equalTo: menuRecommendationView.bottomAnchor, constant: 40),
            likeMenuButton.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 20),
            likeMenuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        likeMenuButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    private func setupHomeButtonUI() {
        NSLayoutConstraint.activate([
            homeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height * 0.075),
            homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4)
        ])
    }

    private func presentMenuResultViewController() {
        navigationController?.pushViewController(UIViewController(), animated: false)
    }

    private func addActionForButtonEvent() {
        addActionForHateMenuButton()
        addActionForLikeMenuButton()
        addActionForHomeButton()
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

    private func addActionForHomeButton() {
        homeButton.addAction(
            UIAction { [weak self] _ in
                self?.homeButton.backgroundColor = UIColor(named: "darkGreenColor")
            },
            for: .touchDown
        )
        homeButton.addAction(
            UIAction { [weak self] _ in
                self?.homeButton.backgroundColor = UIColor(named: "mainGreenColor")
                self?.view.subviews.forEach { $0.removeFromSuperview() }
                self?.navigationController?.popViewController(animated: true)
            },
            for: [.touchUpOutside, .touchUpInside]
        )
    }

    private func setCardGradientBackground() {
        guard menuRecommendationView.currentCardIndex == .zero else {
            return
        }

        for index in 0..<menuRecommendationView.countOfVisibleCards {
            guard let card = menuRecommendationView.viewForCard(at: index) as? MenuRecommendationContentView else {
                return
            }

            card.setGradientBackground()
        }
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
    func koloda(_ koloda: KolodaView, didShowCardAt index: Int) {
        if let nextCard = koloda.viewForCard(at: index + 1) as? MenuRecommendationContentView {
            nextCard.setGradientBackground()
        }
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

extension MenuRecommendationViewController {
    fileprivate func returnRainbowColor(_ index: Int) -> UIColor {
        switch index % 5 {
        case 0:
            return .red
        case 1:
            return .orange
        case 2:
            return .yellow
        case 3:
            return .green
        case 4:
            return .blue
        default:
            return .clear
        }
    }
}
