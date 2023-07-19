//
//  MenuRecommendationViewController.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/18.
//

import UIKit

final class MenuRecommendationViewController: UIViewController {

    // MARK: Properties

    private let logoImageView = UIImageView()
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()

    // MARK: - Methods

    private func configureHierarchy() {
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
        configureUI()
    }
    private func configureUI() {
        logoImageView.configureUI(image: UIImage(systemName: "star.fill"))
        setupLogoImageViewUI()
    private func setupLogoImageViewUI() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    }
    }
}
