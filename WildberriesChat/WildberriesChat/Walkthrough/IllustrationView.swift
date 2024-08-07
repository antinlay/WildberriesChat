//
//  IllustrationView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 12.06.2024.
//

import SwiftUI

struct IllustrationView: View {
    var body: some View {
        VStack {
            Image(.illustration)
                .resizable()
                .scaledToFit()
                .padding(EdgeInsets(top: 135, leading: 62, bottom: 42, trailing: 62))
            Text("Общайтесь с друзьями\n и близкими легко")
                .font(FontStyles.headingSecond)
                .foregroundStyle(.neutral)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    IllustrationView()
}