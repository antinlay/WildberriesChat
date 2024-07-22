//
//  FontStyles.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 11.06.2024.
//

import SwiftUI

struct FontStyles: ViewModifier {
    static var bodyFirst = Font
        .system(size: 14, weight: .semibold)
    
    static var bodySecond = Font
        .system(size: 14, weight: .regular)
    
    static var subheadingFirst = Font
        .system(size: 18, weight: .semibold)
    
    static var subheadingSecond = Font
        .system(size: 16, weight: .semibold)
    
    static var headingFirst = Font
        .system(size: 32, weight: .bold)
    
    static var headingSecond = Font
        .system(size: 24, weight: .bold)
    
    static var metadataFirst = Font
        .system(size: 12)
    
    static var metadataSecond = Font
        .system(size: 10)
    
    public func body(content: Content) -> some View {
        content
    }
}
