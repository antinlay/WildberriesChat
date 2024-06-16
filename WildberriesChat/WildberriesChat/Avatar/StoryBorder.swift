//
//  StoryBorder.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

public struct StoryBorder: ViewModifier {
    public func body(content: Content) -> some View {
        ZStack {
            content
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    LinearGradient(
                        colors: [.Gradients.storyFirst, .Gradients.storySecond],
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 2
                )
                .frame(width: 56, height: 56)
        }
    }
}

extension View {
    func storyBorder() -> some View {
        modifier(StoryBorder())
    }
}
