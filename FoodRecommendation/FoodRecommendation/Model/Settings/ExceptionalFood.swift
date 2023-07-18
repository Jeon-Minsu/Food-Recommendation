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
        let image: UIImage
    }
}

extension ExceptionalFood {
    static let testData1 = [
        Category(title: "알류(egg)", image: UIImage(systemName: "star.fill")!),
        Category(title: "우유", image: UIImage(systemName: "star.fill")!),
        Category(title: "땅콩", image: UIImage(systemName: "star.fill")!),
        Category(title: "견과류", image: UIImage(systemName: "star.fill")!),
        Category(title: "밀", image: UIImage(systemName: "star.fill")!),
        Category(title: "참깨", image: UIImage(systemName: "star.fill")!),
        Category(title: "콩(대두)", image: UIImage(systemName: "star.fill")!),
        Category(title: "과일, 채소", image: UIImage(systemName: "star.fill")!),
        Category(title: "해산물", image: UIImage(systemName: "star.fill")!),
        Category(title: "조개류", image: UIImage(systemName: "star.fill")!)
    ]
    static let testData2 = [
        Category(title: "매운 맛", image: UIImage(systemName: "star.fill")!),
        Category(title: "단 맛", image: UIImage(systemName: "star.fill")!),
        Category(title: "신 맛", image: UIImage(systemName: "star.fill")!),
        Category(title: "짠 맛", image: UIImage(systemName: "star.fill")!),
        Category(title: "느끼함", image: UIImage(systemName: "star.fill")!),
    ]
}
