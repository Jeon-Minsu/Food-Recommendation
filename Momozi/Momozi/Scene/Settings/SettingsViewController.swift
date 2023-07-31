//
//  SettingsViewController.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: Typealias

    private typealias DataSource = UICollectionViewDiffableDataSource<ExceptionReasonSection, MenuCategory>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<ExceptionReasonSection, MenuCategory>

    // MARK: - Properties

    private let characterImageView = UIImageView()
    private let logoImageView = UIImageView()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureLayout())
    private let veganDeclarationButton = VeganDeclarationButton()
    private let menuRecommendationButton = UIButton()
    private let copyrightLabel = UILabel()
    private var dataSource: DataSource?
    private var excludedCategories: [MenuCategory] = []

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        applySnapshot()
        addActionForButtonEvent()
    }

    // MARK: - Methods

    private func configureHierarchy() {
        configureOverallUI()
        configureDetailUI()
        configureDataSource()
        configureDelegate()
    }

    private func configureOverallUI() {
        setupBackgroundUI()
    }

    private func setupBackgroundUI() {
        let gradientStartColor = UIColor(named: "menuRecommendationGradientStartColor")
        let gradientEndColor = UIColor(named: "menuRecommendationGradientEndColor")

        view.setGradientBackground(startColor: gradientStartColor, endColor: gradientEndColor)
    }

    private func configureDetailUI() {
        characterImageView.configureUI(image: UIImage(named: "momoziImage")?.resize(newWidth: view.frame.width * 0.08))
        logoImageView.configureUI(image: UIImage(named: "logo")?.resize(newWidth: view.frame.width * 0.32))
        collectionView.configureUI(backgroundColor: .clear)
        veganDeclarationButton.configureUI(cornerRadius: 20, borderWidth: 2, borderColor: UIColor(named: "mainBorderColor")?.cgColor, backgroundColor: .white)
        menuRecommendationButton.configureUI(
            title: "추천 받기!",
            font: .systemFont(ofSize: 24, weight: .heavy),
            titleColor: .white,
            backgroundColor: UIColor(named: "mainOrangeColor"),
            cornerRadius: 20
        )
        copyrightLabel.configureUI(
            text: "Icon made by Freepik from www.flaticon.com",
            textColor: .systemGray2,
            textAlignment: .center,
            font: UIFont.systemFont(ofSize: 10)
        )

        [characterImageView, logoImageView, collectionView, veganDeclarationButton, menuRecommendationButton, copyrightLabel].forEach { view.addSubview($0) }

        setupCharacterImageViewUI()
        setupLogoImageViewUI()
        setupCollectionViewUI()
        setupVeganDeclarationButtonUI()
        setupMenuRecommendastionButtonUI()
        setupCopyrightLabelUI()
    }

    private func setupCharacterImageViewUI() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.0775),
            characterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width * 0.05)
        ])
    }

    private func setupLogoImageViewUI() {
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: -15),
            logoImageView.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor)
        ])

        logoImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    private func setupCollectionViewUI() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.665)
        ])
    }

    private func setupVeganDeclarationButtonUI() {
        NSLayoutConstraint.activate([
            veganDeclarationButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            veganDeclarationButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.06),
            veganDeclarationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            veganDeclarationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }

    private func setupMenuRecommendastionButtonUI() {
        NSLayoutConstraint.activate([
            menuRecommendationButton.topAnchor.constraint(equalTo: veganDeclarationButton.bottomAnchor, constant: 13),
            menuRecommendationButton.heightAnchor.constraint(equalTo: veganDeclarationButton.heightAnchor),
            menuRecommendationButton.leadingAnchor.constraint(equalTo: veganDeclarationButton.leadingAnchor),
            menuRecommendationButton.trailingAnchor.constraint(equalTo: veganDeclarationButton.trailingAnchor)
        ])
    }

    private func setupCopyrightLabelUI() {
        NSLayoutConstraint.activate([
            copyrightLabel.topAnchor.constraint(equalTo: menuRecommendationButton.bottomAnchor, constant: 10),
            copyrightLabel.leadingAnchor.constraint(equalTo: menuRecommendationButton.leadingAnchor),
            copyrightLabel.trailingAnchor.constraint(equalTo: menuRecommendationButton.trailingAnchor)
        ])
    }

    private func configureDataSource() {
        registerCell()
        registerHeaderView()
    }

    private func registerCell() {
        let cellRegistration = UICollectionView.CellRegistration<SettingsCell, MenuCategory> { cell, _, item in
            cell.set(title: item.getTitle(), image: item.getImage(), category: item)
        }

        dataSource = UICollectionViewDiffableDataSource<ExceptionReasonSection, MenuCategory>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
    }

    private func registerHeaderView() {
        let headerRegistration = UICollectionView.SupplementaryRegistration<SectionHeaderView>(elementKind: SectionHeaderView.elementKind) { supplementaryView, _, indexPath in
            if indexPath.section == 0 {
                supplementaryView.set(title: ExceptionReasonSection.allergy.rawValue)
                supplementaryView.showCautionMessageIfNeeded(shouldShow: true)
            } else {
                supplementaryView.set(title: ExceptionReasonSection.unpreferredFood.rawValue)
                supplementaryView.showCautionMessageIfNeeded(shouldShow: false)
            }
        }

        dataSource?.supplementaryViewProvider = { _, _, index in
            return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: index)
        }
    }

    private func configureDelegate() {
        collectionView.delegate = self
    }

    private func applySnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([ExceptionReasonSection.allergy])
        snapshot.appendItems(ExceptionReasonSection.allergy.loadContents())
        snapshot.appendSections([ExceptionReasonSection.dummy])
        snapshot.appendItems(ExceptionReasonSection.dummy.loadContents())
        snapshot.appendSections([ExceptionReasonSection.unpreferredFood])
        snapshot.appendItems(ExceptionReasonSection.unpreferredFood.loadContents())
        dataSource?.apply(snapshot)
    }

    private func addActionForButtonEvent() {
        addActionForVeganDeclaration()
        addActionForMenuRecommendation()
    }

    private func addActionForVeganDeclaration() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapVeganDeclarationButton))
        veganDeclarationButton.addGestureRecognizer(gesture)
    }

    @objc private func didTapVeganDeclarationButton(_ gesture: UITapGestureRecognizer) {
        veganDeclarationButton.toggleUI()
        manageExcludedCategoriesFrom(veganDeclarationButton)
    }

    private func manageExcludedCategoriesFrom(_ button: VeganDeclarationButton) {
        if button.buttonDidToggle() {
            excludedCategories.append(.vegan)
        } else {
            if let index = excludedCategories.firstIndex(of: .vegan) {
                excludedCategories.remove(at: index)
            }
        }
    }

    private func addActionForMenuRecommendation() {
        menuRecommendationButton.addAction(
            UIAction { [weak self] _ in
                self?.menuRecommendationButton.backgroundColor = UIColor(named: "mainTangerineColor")
            },
            for: .touchDown
        )
        menuRecommendationButton.addAction(
            UIAction { [weak self] _ in
                self?.menuRecommendationButton.backgroundColor = UIColor(named: "mainOrangeColor")
                self?.pushMenuRecommendationViewController()
            },
            for: [.touchUpOutside, .touchUpInside]
        )
    }

    private func pushMenuRecommendationViewController() {
        let filteredMenu = MenuDataManager.shared.getFilteredMenus(excludedCategories: excludedCategories)
        let nextViewController = MenuRecommendationViewController()
        nextViewController.update(filteredMenu)
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    private func configureLayout() -> UICollectionViewCompositionalLayout {
        let item = setupItemLayout()
        let group = setupGroupLayout(using: item)
        let section = setupSectionLayout(using: group)
        let layout = UICollectionViewCompositionalLayout { [weak self] (index, _) -> NSCollectionLayoutSection? in
            self?.setupLayoutForSectionIndex(section: section, sectionIndex: index)
        }

        layout.register(SectionCharacterDecorationView.self, forDecorationViewOfKind: "SectionCharacterDecorationView")
        layout.register(SectionBackgroundDecorationView.self, forDecorationViewOfKind: "SectionBackgroundDecorationView")

        return layout
    }

    private func setupItemLayout() -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        return item
    }

    private func setupGroupLayout(using item: NSCollectionLayoutItem) -> NSCollectionLayoutGroup {
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.225)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 4
        )

        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)

        return group
    }

    private func setupSectionLayout(using group: NSCollectionLayoutGroup) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 10,
            bottom: 10,
            trailing: 10
        )

        return section
    }

    private func setupLayoutForSectionIndex(section: NSCollectionLayoutSection, sectionIndex: Int) -> NSCollectionLayoutSection? {
        switch sectionIndex {
        case 0:
            setupSectionHeaderLayout(section)
            setupSectionDecorationLayout(section: section, backgroundDecoration: setupSectionBackgroundDecorationLayout())

            return section
        case 2:
            setupSectionHeaderLayout(section)
            setupSectionDecorationLayout(section: section, backgroundDecoration: setupSectionBackgroundDecorationLayout(), characterDecoration: setupSectionCharacterDecorationLayout())

            return section
        default:
            return setupDummySection()
        }
    }

    private func setupSectionHeaderLayout(_ section: NSCollectionLayoutSection) {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: SectionHeaderView.elementKind,
            alignment: .topLeading
        )
        section.boundarySupplementaryItems = [sectionHeader]
    }

    private func setupSectionBackgroundDecorationLayout() -> NSCollectionLayoutDecorationItem {
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.elementKind)
        sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)

        return sectionBackgroundDecoration
    }

    private func setupSectionCharacterDecorationLayout() -> NSCollectionLayoutDecorationItem {
        let sectionCharacterDecoration = NSCollectionLayoutDecorationItem.background(elementKind: SectionCharacterDecorationView.elementKind)
        sectionCharacterDecoration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)

        return sectionCharacterDecoration
    }

    private func setupSectionDecorationLayout(section: NSCollectionLayoutSection, backgroundDecoration: NSCollectionLayoutDecorationItem? = nil, characterDecoration: NSCollectionLayoutDecorationItem? = nil) {
        if let backgroundDecoration = backgroundDecoration,
           let characterDecoration = characterDecoration {
            backgroundDecoration.zIndex = -1
            characterDecoration.zIndex = 0
            section.decorationItems = [backgroundDecoration, characterDecoration]
        } else if let backgroundDecoration = backgroundDecoration {
            section.decorationItems = [backgroundDecoration]
        }
    }

    private func setupDummySection() -> NSCollectionLayoutSection {
        let dummyItem = setupDummyItemLayout()
        let dummyGroup = setupDummyGroupLayout(using: dummyItem)
        let dummySection = setupDummySectionLayout(using: dummyGroup)

        return dummySection
    }

    private func setupDummyItemLayout() -> NSCollectionLayoutItem {
        let dummyItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.1)
        )
        let dummyItem = NSCollectionLayoutItem(layoutSize: dummyItemSize)

        return dummyItem
    }

    private func setupDummyGroupLayout(using dummyItem: NSCollectionLayoutItem) -> NSCollectionLayoutGroup {
        let dummyGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(1.0)
        )
        let dummyGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: dummyGroupSize,
            subitem: dummyItem,
            count: 1
        )

        return dummyGroup
    }

    private func setupDummySectionLayout(using dummyGroup: NSCollectionLayoutGroup) -> NSCollectionLayoutSection {
        let dummySection = NSCollectionLayoutSection(group: dummyGroup)
        dummySection.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        return dummySection
    }
}

// MARK: - Extensions

extension SettingsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SettingsCell else {
            return
        }

        cell.toggleUI()
        manageExcludedCategoriesFrom(cell)
    }

    private func manageExcludedCategoriesFrom(_ cell: SettingsCell) {
        let categoryOfCurrentCell = cell.extractCategoryOfCell()

        if cell.settingsCellDidToggle() {
            excludedCategories.append(categoryOfCurrentCell)
        } else {
            if let index = excludedCategories.firstIndex(of: categoryOfCurrentCell) {
                excludedCategories.remove(at: index)
            }
        }
    }
}
