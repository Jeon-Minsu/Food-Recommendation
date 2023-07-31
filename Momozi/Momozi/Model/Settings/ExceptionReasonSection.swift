//
//  ExceptionReasonSection.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

enum ExceptionReasonSection: String {
    case allergy = "알러지"
    case dummy = "더미"
    case unpreferredFood = "싫어해요"

    func loadContents() -> [MenuCategory] {
        switch self {
        case .allergy:
            return [
                .egg,
                .milk,
                .peanut,
                .nuts,
                .wheat,
                .sesame,
                .soybean,
                .fruitsAndVegetables,
                .seafood,
                .shellfish
            ]
        case .dummy:
            return [.dummy]
        case .unpreferredFood:
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
