//
//  KolodaView+Extension.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/25.
//

import Koloda

extension KolodaView {
    func returnCardBackgroundColor(_ index: Int) -> UIColor? {
        switch index {
        case 0:
            return .white
        case let index where index % 2 == 0:
            return UIColor.Custom.mainTangerineColor
        default:
            return UIColor.Custom.mainGoldenrodColor
        }
    }
}
