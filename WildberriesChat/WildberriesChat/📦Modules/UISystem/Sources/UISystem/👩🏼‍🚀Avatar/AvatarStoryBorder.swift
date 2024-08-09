//
//  AvatarStoryBorder.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

public struct AvatarStoryBorder: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        ZStack {
            content
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    LinearGradient(
                        colors: [Color("Gradient/StoryFirst", bundle: .main), Color("Gradient/StorySecond", bundle: .main)],
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 2
                )
                .frame(width: 56, height: 56)
        }
    }
}
