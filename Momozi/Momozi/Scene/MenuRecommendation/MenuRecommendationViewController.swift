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
        handleRunOutOfCardsIfNeeded()
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
        let image = UIImage.Custom.logoImage?.resize(newWidth: view.frame.width * 0.3)
        let logoImageView = UIImageView(image: image)
        navigationItem.titleView = logoImageView
        navigationItem.hidesBackButton = true
    }

    private func setupBackgroundUI() {
        view.setGradientBackground(
            startColor: UIColor.Custom.mainGradientStartColor,
            endColor: UIColor.Custom.mainGradientEndColor,
            patternImage: UIImage.Custom.backgroundPatternImage
        )
    }

    private func configureDetailUI() {
        createDetailViews()
        addDetailViews()
        setupDetailViewsUI()
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
        menuRecommendationView.layer.shadowColor = UIColor.black.cgColor
        menuRecommendationView.layer.shadowOpacity = 0.5
        menuRecommendationView.layer.shadowOffset = CGSize(width: 0, height: 4)
        menuRecommendationView.layer.shadowRadius = 8
        menuRecommendationView.layer.masksToBounds = false
    }

    private func createSoldOutPanelImageView() {
        soldOutPanelImageView.configureUI(
            image: UIImage.Custom.soldOutPanel,
            alpha: 0,
            contentMode: .scaleAspectFit
        )
    }

    private func createSoldOutCharacterImageView() {
        soldOutCharacterImageView.configureUI(
            image: UIImage.Custom.sadMomoziImage,
            alpha: 0,
            contentMode: .scaleAspectFill
        )
    }

    private func createSoldOutDescriptionLabel() {
        soldOutDescriptionLabel.configureUI(
            text: "추천 메뉴가 다 떨어졌어요...",
            textColor: UIColor.Custom.soldOutTextColor,
            textAlignment: .center,
            font: UIFont.Custom.menuDescription(size: 23),
            alpha: 0
        )
    }

    private func createHateMenuButton() {
        hateMenuButton.configureUI(
            title: "싫어..",
            font: .preferredFont(forTextStyle: .title3),
            tintColor: UIColor.Custom.mainGreenColor,
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
            tintColor: UIColor.Custom.mainTangerineColor,
            image: UIImage(
                systemName: "chevron.right",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
            ),
            imageEdgeInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -10),
            semanticContentAttribute: .forceRightToLeft
        )
    }

    private func createHomeButton() {
        homeButton.configureUI(
            title: "처음으로",
            font: .systemFont(ofSize: 25, weight: .bold),
            titleColor: .white,
            backgroundColor: UIColor.Custom.mainGreenColor,
            cornerRadius: 20
        )
    }

    private func addDetailViews() {
        [
            menuRecommendationView,
            soldOutPanelImageView,
            soldOutCharacterImageView,
            soldOutDescriptionLabel,
            hateMenuButton,
            descriptionLabel,
            likeMenuButton,
            homeButton
        ].forEach { view.addSubview($0) }
    }

    private func setupDetailViewsUI() {
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
            menuRecommendationView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: view.frame.height * 0.0675
            ),
            menuRecommendationView.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.575
            ),
            menuRecommendationView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            menuRecommendationView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            )
        ])
    }

    private func setupSoldOutPanelImageViewUI() {
        NSLayoutConstraint.activate([
            soldOutPanelImageView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: view.frame.height * 0.16
            ),
            soldOutPanelImageView.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.27
            ),
            soldOutPanelImageView.widthAnchor.constraint(
                equalTo: soldOutPanelImageView.heightAnchor,
                multiplier: 1.05
            ),
            soldOutPanelImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupSoldOutCharacterImageViewUI() {
        NSLayoutConstraint.activate([
            soldOutCharacterImageView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: view.frame.height * 0.38
            ),
            soldOutCharacterImageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor,
                constant: -40
            ),
            soldOutCharacterImageView.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.625
            ),
            soldOutCharacterImageView.heightAnchor.constraint(
                equalTo: soldOutCharacterImageView.widthAnchor
            )
        ])
    }

    private func setupSoldOutDescriptionLabelUI() {
        NSLayoutConstraint.activate([
            soldOutDescriptionLabel.topAnchor.constraint(
                equalTo: soldOutCharacterImageView.bottomAnchor
            ),
            soldOutDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupHateMenuButtonUI() {
        NSLayoutConstraint.activate([
            hateMenuButton.topAnchor.constraint(
                equalTo: menuRecommendationView.bottomAnchor,
                constant: 40
            ),
            hateMenuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        hateMenuButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    private func setupDescriptionLabelUI() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: hateMenuButton.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: hateMenuButton.trailingAnchor,
                constant: 20
            )
        ])
    }

    private func setupLikeMenuButtonUI() {
        NSLayoutConstraint.activate([
            likeMenuButton.topAnchor.constraint(
                equalTo: menuRecommendationView.bottomAnchor,
                constant: 40
            ),
            likeMenuButton.leadingAnchor.constraint(
                equalTo: descriptionLabel.trailingAnchor,
                constant: 20
            ),
            likeMenuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        likeMenuButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    private func setupHomeButtonUI() {
        NSLayoutConstraint.activate([
            homeButton.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -view.bounds.height * 0.075
            ),
            homeButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.06),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            homeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
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
            UIAction { [weak self] _ in self?.menuRecommendationView.swipe(.left) },
            for: .allEvents
        )
    }

    private func addActionForLikeMenuButton() {
        likeMenuButton.addAction(
            UIAction { [weak self] _ in self?.menuRecommendationView.swipe(.right) },
            for: .allEvents
        )
    }

    private func addActionForHomeButton() {
        homeButton.addAction(
            UIAction { [weak self] _ in
                self?.homeButton.backgroundColor = UIColor.Custom.darkGreenColor
            },
            for: .touchDown
        )
        homeButton.addAction(
            UIAction { [weak self] _ in
                self?.homeButton.backgroundColor = UIColor.Custom.mainGreenColor
                self?.view.subviews.forEach { $0.removeFromSuperview() }
                self?.navigationController?.popViewController(animated: true)
            },
            for: [.touchUpOutside, .touchUpInside]
        )
    }

    private func handleRunOutOfCardsIfNeeded() {
        if menuRecommendationView.isRunOutOfCards {
            self.kolodaDidRunOutOfCards(menuRecommendationView)
        }
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
        view.backgroundColor = koloda.getCardBackgroundColor(index)
        view.layer.cornerRadius = 20
        view.performAnimation(upon: index)
        view.setMenuTitle(filteredMenu[index])
        view.setContentHidden(index > 1)

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
        let numberOfCards = min(3, koloda.countOfCards)

        for cardIndex in 0..<numberOfCards {
            if let card = koloda.viewForCard(at: index + cardIndex) as? MenuRecommendationContentView {
                updateCardUI(card, at: cardIndex)
            }
        }
    }

    private func updateCardUI(_ card: MenuRecommendationContentView, at index: Int) {
        let animationDuration: TimeInterval = 0.2

        UIView.animate(withDuration: animationDuration) {
            switch index {
            case 0:
                card.backgroundColor = .white
            case 1:
                card.backgroundColor = UIColor.Custom.mainGoldenrodColor
                card.setGradientBackground()
                card.setContentHidden(false)
            case 2:
                card.backgroundColor = UIColor.Custom.mainTangerineColor
            default:
                break
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
