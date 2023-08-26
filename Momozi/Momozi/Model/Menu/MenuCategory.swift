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
            return UIImage.Custom.korean
        case .chinese:
            return UIImage.Custom.chinese
        case .japanese:
            return UIImage.Custom.japanese
        case .western:
            return UIImage.Custom.western
        case .asian:
            return UIImage.Custom.asian
        case .mexican:
            return UIImage.Custom.mexican
        case .all:
            return UIImage.Custom.momoziImage
        case .spicyTaste:
            return UIImage.Custom.spicyTaste
        case .sweetTaste:
            return UIImage.Custom.sweetTaste
        case .sourTaste:
            return UIImage.Custom.sourTaste
        case .saltyTaste:
            return UIImage.Custom.saltyTaste
        case .greasyTaste:
            return UIImage.Custom.greasyTaste
        default:
            return nil
        }
    }
}
