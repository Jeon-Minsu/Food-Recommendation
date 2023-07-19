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
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()

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
        setupLogoImageViewUI()
        setupMenuRecommendationView()
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
// MARK: - Extensions

extension MenuRecommendationViewController: KolodaViewDataSource {
}
extension MenuRecommendationViewController: KolodaViewDelegate {
}
    }
}
