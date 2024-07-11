//
//  Emoji.swift
//  WildberriesInfinityScroll
//
//  Created by Janiece Eleonour on 11.07.2024.
//

import Foundation

struct Emoji {
    static var korean: [String] = {
        let emojiRanges = 0x1F200...0x1F43E
        
        let emojiArray: [String] = emojiRanges.map { closedRange in
            if let scalar = UnicodeScalar(closedRange), scalar.properties.isEmoji {
                return String(scalar)
            } else {
                return String()
            }
        }
        
        return emojiArray.filter { !$0.isEmpty }
    }()
}
