//
//  SettingsViewController.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: Typealias

    private typealias Category = ExceptionalFood.Category
    private typealias DataSource = UICollectionViewDiffableDataSource<ExceptionReasonSection, Category>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<ExceptionReasonSection, Category>

    // MARK: - Properties

    private let logoImageView = UIImageView()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureLayout())
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    private func configureHierarchy() {
        view.backgroundColor = .systemBackground
        collectionView.delegate = self
        configureUI()
    }
    private func configureUI() {
        logoImageView.configureUI(image: UIImage(systemName: "star.fill"))
        collectionView.configureUI()
        setupLogoImageViewUI()
        setupCollectionViewUI()
    private func setupLogoImageViewUI() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupCollectionViewUI() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65)
        ])
    }

    private func configureDataSource() {
        registerCell()
        registerHeaderView()
    }

    private func registerCell() {
        let cellRegistration = UICollectionView.CellRegistration<SettingsCell, Category> { cell, _, item in
            cell.set(title: item.title, image: item.image)
        }
        
        dataSource = UICollectionViewDiffableDataSource<ExceptionReasonSection, Category>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
    }

    private func registerHeaderView() {
        let headerRegistration = UICollectionView.SupplementaryRegistration<SectionHeaderView>(elementKind: SectionHeaderView.elementKind) { supplementaryView, _, indexPath in
            let title = indexPath.section == 0
            ? ExceptionReasonSection.allergy.rawValue
            : ExceptionReasonSection.unpreferredFood.rawValue

            supplementaryView.set(title: title)
        }

        dataSource?.supplementaryViewProvider = { _, _, index in
            return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: index)
        }
    }

    private func configureLayout() -> UICollectionViewCompositionalLayout {
        let item = setupItemLayout()
        let group = setupGroupLayout(using: item)
        let section = setupSectionLayout(using: group)
        setupSectionHeaderLayout(section)
        let layout = UICollectionViewCompositionalLayout(section: section)

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
            heightDimension: .fractionalWidth(0.22)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 4
        )
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)

        return group
    }

    private func setupSectionLayout(using group: NSCollectionLayoutGroup) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = CGFloat(10)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 10,
            bottom: 10,
            trailing: 10
        )

        return section
    }

    private func setupSectionHeaderLayout(_ section: NSCollectionLayoutSection) {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: SectionHeaderView.elementKind,
            alignment: .topLeading
        )
        section.boundarySupplementaryItems = [sectionHeader]
    }

    private func applySnapshot() {
        let allergyList = ExceptionalFood(categories: ExceptionalFood.testData1)
        let unpreferredFoodList = ExceptionalFood(categories: ExceptionalFood.testData2)
        var snapshot = Snapshot()
        snapshot.appendSections([.allergy])
        snapshot.appendItems(allergyList.categories)
        snapshot.appendSections([.unpreferredFood])
        snapshot.appendItems(unpreferredFoodList.categories)

        dataSource?.apply(snapshot)
    }
// MARK: - Extensions

extension SettingsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SettingsCell else {
            return
        }

        cell.toggleUI()
    }
}
