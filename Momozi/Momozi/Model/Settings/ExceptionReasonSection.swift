//
//  ExceptionReasonSection.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

enum ExceptionReasonSection: String {
    case includedRecommendations = "추천 받기"
    case dummy = "더미"
    case excludedRecommendations = "추천 안받기"

    func loadContents() -> [MenuCategory] {
        switch self {
        case .includedRecommendations:
            return [
                .korean,
                .chinese,
                .japanese,
                .western,
                .asian,
                .mexican,
                .all
            ]
        case .dummy:
            return [.dummy]
        case .excludedRecommendations:
            return [
                .spicyTaste,
                .sweetTaste,
                .sourTaste,
                .saltyTaste,
                .greasyTaste
            ]
        }
    }
}
