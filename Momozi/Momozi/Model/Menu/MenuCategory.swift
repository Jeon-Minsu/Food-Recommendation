//
//  MenuCategory.swift
//  Momozi
//
//  Created by 전민수 on 2023/07/31.
//

import UIKit

enum MenuCategory: CaseIterable {
    case egg
    case milk
    case peanut
    case nuts
    case wheat
    case sesame
    case soybean
    case fruitsAndVegetables
    case seafood
    case shellfish
    case spicyTaste
    case sweetTaste
    case sourTaste
    case saltyTaste
    case greasyTaste
    case vegan
    case dummy

    func getTitle() -> String {
        switch self {
        case .egg:
            return "알류(egg)"
        case .milk:
            return "우유"
        case .peanut:
            return "땅콩"
        case .nuts:
            return "견과류"
        case .wheat:
            return "밀"
        case .sesame:
            return "참깨"
        case .soybean:
            return "콩(대두)"
        case .fruitsAndVegetables:
            return "과일, 채소"
        case .seafood:
            return "해산물"
        case .shellfish:
            return "조개류"
        case .spicyTaste:
            return "매운 맛"
        case .sweetTaste:
            return "단 맛"
        case .sourTaste:
            return "신 맛"
        case .saltyTaste:
            return "짠 맛"
        case .greasyTaste:
            return "느끼함"
        case .vegan:
            return "비건"
        case .dummy:
            return ""
        }
    }

    func getImage() -> UIImage? {
        switch self {
        case .egg:
            return UIImage(named: "eggImage")
        case .milk:
            return UIImage(named: "milkImage")
        case .peanut:
            return UIImage(named: "peanutImage")
        case .nuts:
            return UIImage(named: "nutsImage")
        case .wheat:
            return UIImage(named: "wheatImage")
        case .sesame:
            return UIImage(named: "sesameImage")
        case .soybean:
            return UIImage(named: "soybeanImage")
        case .fruitsAndVegetables:
            return UIImage(named: "fruitsAndVegetablesImage")
        case .seafood:
            return UIImage(named: "seafoodImage")
        case .shellfish:
            return UIImage(named: "shellfishImage")
        case .spicyTaste:
            return UIImage(named: "spicyTasteImage")
        case .sweetTaste:
            return UIImage(named: "sweetTasteImage")
        case .sourTaste:
            return UIImage(named: "sourTasteImage")
        case .saltyTaste:
            return UIImage(named: "saltyTasteImage")
        case .greasyTaste:
            return UIImage(named: "greasyTasteImage")
        case .vegan:
            return nil
        case .dummy:
            return nil
        }
    }
}

