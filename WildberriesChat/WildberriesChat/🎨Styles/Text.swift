//
//  Text.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

public struct InputTextField: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.bodyFirst)
            .foregroundStyle(.appGray)
            .padding(.horizontal, 8)
    }
}
