//
//  Button.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 11.06.2024.
//

import SwiftUI

public struct ActionButton: ButtonStyle {
    var isDisabled: Bool
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadingSecond)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(.accent)
            .clipShape(.capsule)
            .opacity(configuration.isPressed || isDisabled ? 0.5 : 1)
            .disabled(isDisabled)
            .animation(.interactiveSpring(), value: configuration.isPressed)
    }
}
