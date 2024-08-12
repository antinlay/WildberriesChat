//
//  AvatarStoryBorder.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

public struct AvatarStoryBorder: View {
    public init() {}
    public var body: some View {
        RoundedRectangle(cornerRadius: 18)
            .stroke(
                LinearGradient(
                    colors: [Color("Gradients/StoryFirst", bundle: .main), Color("Gradients/StorySecond", bundle: .main)],
                    startPoint: .leading,
                    endPoint: .trailing
                ),
                lineWidth: 2
            )
            .frame(width: 56, height: 56)
    }
}
