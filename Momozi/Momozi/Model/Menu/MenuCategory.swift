//
//  MenuCategory.swift
//  Momozi
//
//  Created by 전민수 on 2023/07/31.
//

import UIKit

enum MenuCategory: Int, CaseIterable {
    case korean
    case chinese
    case japanese
    case western
    case asian
    case mexican
    case all
    case spicyTaste
    case sweetTaste
    case sourTaste
    case saltyTaste
    case greasyTaste
    case vegan
    case soloDining
    case dummy

    func getTitle() -> String {
        switch self {
        case .korean:
            return "한식"
        case .chinese:
            return "중식"
        case .japanese:
            return "일식"
        case .western:
            return "양식"
        case .asian:
            return "아시안"
        case .mexican:
            return "멕시칸"
        case .all:
            return "아무거나!"
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
        case .soloDining:
            return "혼밥"
        case .dummy:
            return ""
        }
    }

    func getImage() -> UIImage? {
        switch self {
        case .korean:
            return UIImage(named: "eggImage")
        case .chinese:
            return UIImage(named: "milkImage")
        case .japanese:
            return UIImage(named: "peanutImage")
        case .western:
            return UIImage(named: "nutsImage")
        case .asian:
            return UIImage(named: "wheatImage")
        case .mexican:
            return UIImage(named: "sesameImage")
        case .all:
            return UIImage(named: "soybeanImage")
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
        case .soloDining:
            return nil
        case .dummy:
            return nil
        }
    }
}
