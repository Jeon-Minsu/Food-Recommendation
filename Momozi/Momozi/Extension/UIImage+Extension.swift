//
//  UIImage+Extension.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/25.
//

import UIKit

extension UIImage {
    enum Custom {
        static let korean = UIImage(named: "EggImage")
        static let chinese = UIImage(named: "MilkImage")
        static let japanese = UIImage(named: "PeanutImage")
        static let western = UIImage(named: "NutsImage")
        static let asian = UIImage(named: "WheatImage")
        static let mexican = UIImage(named: "SesameImage")
        static let spicyTaste = UIImage(named: "SpicyTasteImage")
        static let sweetTaste = UIImage(named: "SweetTasteImage")
        static let sourTaste = UIImage(named: "SourTasteImage")
        static let saltyTaste = UIImage(named: "SaltyTasteImage")
        static let greasyTaste = UIImage(named: "GreasyTasteImage")
        static let momoziImage = UIImage(named: "MomoziImage")
        static let logoImage = UIImage(named: "Logo")
        static let vegetableImage = UIImage(named: "VegetableImage")
        static let cautionImage = UIImage(named: "CautionImage")
        static let decorationSpeechBubble = UIImage(named: "DecorationSpeechBubble")
        static let decorationMomoziImage = UIImage(named: "DecorationMomoziImage")
        static let checkedBox = UIImage(named: "CheckedBox")
        static let backgroundPatternImage = UIImage(named: "BackgroundPatternImage")
        static let soldOutPanel = UIImage(named: "SoldOutPanel")
        static let sadMomoziImage = UIImage(named: "SadMomoziImage")
        static let momoziSpeechBubble = UIImage(named: "MomoziSpeechBubble")
        static let speechBubble = UIImage(named: "SpeechBubble")
        static let wasabisanImage = UIImage(named: "WasabisanImage")
    }

    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / size.width
        let newHeight = size.height * scale
        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            draw(in: CGRect(origin: .zero, size: size))
        }

        return renderImage
    }
}
