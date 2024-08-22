//
//  Button.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 11.06.2024.
//

import SwiftUI

public struct ActionButton: ButtonStyle {
    var isDisabled: Bool
    
    public init(isDisabled: Bool) {
        self.isDisabled = isDisabled
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadingSecond)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(Color("AccentColor", bundle: .main))
            .clipShape(.capsule)
            .opacity(configuration.isPressed || isDisabled ? 0.5 : 1)
            .disabled(isDisabled)
            .animation(.interactiveSpring(), value: configuration.isPressed)
    }
}

public struct SettingButton: ButtonStyle {
    var icon: String
    
    public init(icon: String) {
        self.icon = icon
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 6) {
            Rectangle()
                .fill(.clear)
                .frame(width: 24, height: 24)
                .overlay(alignment: .leading, content: {
                    Image("Settings/\(icon)", bundle: .main)
                })
            configuration.label
                .font(.bodyFirst)
                .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
            Image("Shevron", bundle: .main)
                .foregroundColor(Color("NeutralColor", bundle: .main))
                .scaleEffect(x: -1)
        }
    }
}

