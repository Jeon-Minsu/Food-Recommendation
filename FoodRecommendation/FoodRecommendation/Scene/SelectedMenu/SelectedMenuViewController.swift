//
//  SelectedMenuViewController.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/19.
//

import UIKit

final class SelectedMenuViewController: UIViewController {

    // MARK: Properties
    private let firstDescriptionLabel = UILabel()
    private let menuLabel = UILabel()
    private let secondDescriptionLabel = UILabel()
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
    private func configureHierarchy() {
        configureUI()
    }
    private func configureUI() {
        firstDescriptionLabel.configureUI(text: "오늘 \(getEatingTimePhrase()) 메뉴는", textAlignment: .left)
        menuLabel.configureUI(text: "새우 초밥", textAlignment: .center, font: .preferredFont(forTextStyle: .largeTitle))
        secondDescriptionLabel.configureUI(text: "이 좋겠군...", textAlignment: .right)
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
    }
}
