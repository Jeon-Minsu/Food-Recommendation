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
    private let soldOutDescriptionLabel = UILabel()
    private let hateMenuButton = UIButton()
    private let descriptionLabel = UILabel()
    private let likeMenuButton = UIButton()
    private let homeButton = UIButton()
    private var filteredMenu = [String]()

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
        configureOverallUI()
        configureDetailUI()
        configureDataSource()
        configureDelegate()
    }

    private func configureOverallUI() {
        setupNavigationBarUI()
        setupBackgroundUI()
    }

    private func setupNavigationBarUI() {
        let image = UIImage(named: "logo")?.resize(newWidth: view.frame.width * 0.3)
        let logoImageView = UIImageView(image: image)
        navigationItem.titleView = logoImageView
        navigationItem.hidesBackButton = true
    }

    private func setupBackgroundUI() {
        let gradientStartColor = UIColor(named: "menuRecommendationGradientStartColor")
        let gradientEndColor = UIColor(named: "menuRecommendationGradientEndColor")
        let backgroundPatternImage = UIImage(named: "backgroundPatternImage")

        view.setGradientBackground(startColor: gradientStartColor, endColor: gradientEndColor, patternImage: backgroundPatternImage)
    }

    private func configureDetailUI() {
        createDetailViews()
        addDetailViews()
        setupDetailViews()
    }

    private func createDetailViews() {
        createMenuRecommendationView()
        createSoldOutPanelImageView()
        createSoldOutCharacterImageView()
        createSoldOutDescriptionLabel()
        createHateMenuButton()
        createDescriptionlabel()
        createLikeMenuButton()
        createHomeButton()
    }

    private func createMenuRecommendationView() {
        menuRecommendationView.configureUI()
        menuRecommendationView.visibleCardsDirection = .top
        menuRecommendationView.backgroundCardsTopMargin = 5.5
    }

    private func createSoldOutPanelImageView() {
        soldOutPanelImageView.configureUI(image: UIImage(named: "soldOutPanel"), alpha: 0, contentMode: .scaleAspectFit)
    }

    private func createSoldOutCharacterImageView() {
        soldOutCharacterImageView.configureUI(image: UIImage(named: "sadMomoziImage"), alpha: 0, contentMode: .scaleAspectFill)
    }

    private func createSoldOutDescriptionLabel() {
        soldOutDescriptionLabel.configureUI(text: "추천 메뉴가 다 떨어졌어요...", textColor: UIColor(named: "soldOutTextColor"), textAlignment: .center, font: UIFont(name: "MaplestoryOTFLight", size: 23), alpha: 0)
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

    private func createDescriptionlabel() {
        descriptionLabel.configureUI(text: "옆으로 밀어서 넘기기", textAlignment: .center)
    }

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

    private func addDetailViews() {
        [menuRecommendationView, soldOutPanelImageView, soldOutCharacterImageView, soldOutDescriptionLabel, hateMenuButton, descriptionLabel, likeMenuButton, homeButton].forEach { view.addSubview($0) }
    }

    private func setupDetailViews() {
        setupMenuRecommendationViewUI()
        setupSoldOutPanelImageViewUI()
        setupSoldOutCharacterImageViewUI()
        setupSoldOutDescriptionLabelUI()
        setupHateMenuButtonUI()
        setupDescriptionLabelUI()
        setupLikeMenuButtonUI()
        setupHomeButtonUI()
    }

    private func setupMenuRecommendationViewUI() {
        NSLayoutConstraint.activate([
            menuRecommendationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height * 0.0675),
            menuRecommendationView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.575),
            menuRecommendationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menuRecommendationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func setupSoldOutPanelImageViewUI() {
        NSLayoutConstraint.activate([
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

    private func setupSoldOutDescriptionLabelUI() {
        NSLayoutConstraint.activate([
            soldOutDescriptionLabel.topAnchor.constraint(equalTo: soldOutCharacterImageView.bottomAnchor),
            soldOutDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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

    private func configureDataSource() {
        menuRecommendationView.dataSource = self
    }

    private func configureDelegate() {
        menuRecommendationView.delegate = self
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

    private func presentMenuResultViewController(with menu: String) {
        let nextViewController = SelectedMenuViewController()
        nextViewController.updateMenu(menu)
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    func update(_ menu: [String]) {
        filteredMenu = menu
    }
}

// MARK: - Extensions

extension MenuRecommendationViewController: KolodaViewDataSource {
    func koloda(_ koloda: Koloda.KolodaView, viewForCardAt index: Int) -> UIView {
        let view = MenuRecommendationContentView()
        view.backgroundColor = koloda.returnCardBackgroundColor(index)
        view.layer.cornerRadius = 20
        view.performAnimation(upon: index)
        view.setMenuTitle(filteredMenu[index])

        return view
    }

    func kolodaNumberOfCards(_ koloda: Koloda.KolodaView) -> Int {
        return filteredMenu.count
    }

    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        UIView.animate(withDuration: 0.8) { [weak self] in
            self?.soldOutPanelImageView.alpha = 1.0
            self?.soldOutCharacterImageView.alpha = 1.0
            self?.soldOutDescriptionLabel.alpha = 1.0
        }
    }

    func koloda(_ koloda: KolodaView, didShowCardAt index: Int) {
        if let nextCard = koloda.viewForCard(at: index + 1) as? MenuRecommendationContentView {
            nextCard.setGradientBackground()
        }

        if koloda.currentCardIndex == index {
            UIView.animate(withDuration: 0.25) {
                koloda.viewForCard(at: index)?.backgroundColor = .white
                koloda.viewForCard(at: index + 1)?.backgroundColor = UIColor(named: "mainGoldenrodColor")
                koloda.viewForCard(at: index + 2)?.backgroundColor = UIColor(named: "mainTangerineColor")
            }
        }
    }
}

extension MenuRecommendationViewController: KolodaViewDelegate {
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        if direction == .right {
            presentMenuResultViewController(with: filteredMenu[index])
        }
    }
}
