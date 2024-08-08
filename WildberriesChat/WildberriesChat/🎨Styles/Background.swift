//
//  Background.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

public struct InputBackground: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(.neutralReverse)
                    .frame(height: 36)
            )
    }
}

public struct AppBackground: ViewModifier {
    public func body(content: Content) -> some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            content
        }
    }
}
