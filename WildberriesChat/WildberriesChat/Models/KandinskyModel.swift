//
//  Kandinsky.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 21.08.2024.
//

import Foundation

enum KandinskyImageSize: CaseIterable {
    case square
    case twoByThree
    case threeByTwo
    case nineBySixteen
    case sixteenByNine

    var width: Int {
        switch self {
        case .square:
            return 1024
        case .twoByThree:
            return 683
        case .threeByTwo:
            return 1024
        case .nineBySixteen:
            return 576
        case .sixteenByNine:
            return 1024
        }
    }

    var height: Int {
        switch self {
        case .square:
            return 1024
        case .twoByThree:
            return 1024
        case .threeByTwo:
            return 683
        case .nineBySixteen:
            return 1024
        case .sixteenByNine:
            return 576
        }
    }

    var aspectRatio: CGFloat {
        return CGFloat(width) / CGFloat(height)
    }
}


enum KandinskyStyle: String, Codable, CaseIterable {
    case kandinsky = "KANDINSKY"
    case uhd = "UHD"
    case anime = "ANIME"
}


struct KandinskyParameters {
    let type: String = "GENERATE"
    let style: KandinskyStyle
    let imageSize: KandinskyImageSize = .square
    let numImages: Int = 1
    let negativePrompt: String = "яркие цвета, кислотность, высокая контрастность"
    let prompt: String
    let model_id: String = "4"
    
    init(style: KandinskyStyle = .kandinsky, prompt: String) {
        self.style = style
        self.prompt = prompt
    }
    
}

