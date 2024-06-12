//
//  ButtonStyles.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 11.06.2024.
//

import SwiftUI

public struct ActionButtonStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(FontStyles.subheadingSecond)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(.accent)
            .clipShape(.capsule)
            .padding(EdgeInsets(top: 12, leading: 6, bottom: 12, trailing: 6))
    }
}

extension View {
    func actionButton() -> some View {
        modifier(ActionButtonStyle())
    }
}
