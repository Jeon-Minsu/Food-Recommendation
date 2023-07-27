//
//  ExceptionalFood.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit

struct ExceptionalFood {
    let categories: [Category]

    struct Category: Hashable {
        let title: String
        let image: UIImage?
    }
}

extension ExceptionalFood {
    static let testData1 = [
        Category(title: "알류(egg)", image: UIImage(named: "eggImage")),
        Category(title: "우유", image: UIImage(named: "milkImage")),
        Category(title: "땅콩", image: UIImage(named: "peanutImage")),
        Category(title: "견과류", image: UIImage(named: "nutsImage")),
        Category(title: "밀", image: UIImage(named: "wheatImage")),
        Category(title: "참깨", image: UIImage(named: "sesameImage")),
        Category(title: "콩(대두)", image: UIImage(named: "soybeanImage")),
        Category(title: "과일, 채소", image: UIImage(named: "fruitsAndVegetablesImage")),
        Category(title: "해산물", image: UIImage(named: "seafoodImage")),
        Category(title: "조개류", image: UIImage(named: "shellfishImage"))
    ]
    static let testData2 = [
        Category(title: "매운 맛", image: UIImage(named: "spicyTasteImage")),
        Category(title: "단 맛", image: UIImage(named: "sweetTasteImage")),
        Category(title: "신 맛", image: UIImage(named: "sourTasteImage")),
        Category(title: "짠 맛", image: UIImage(named: "saltyTasteImage")),
        Category(title: "느끼함", image: UIImage(named: "greasyTasteImage")),
    ]

    static let dummy = [
        Category(title: "dummy", image: nil)
    ]
}
