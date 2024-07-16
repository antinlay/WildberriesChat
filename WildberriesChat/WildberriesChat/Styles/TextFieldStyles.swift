//
//  TextFieldStyles.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

public struct TextFieldStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(FontStyles.bodyFirst)
            .foregroundStyle(.appGray)
    }
}
