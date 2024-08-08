//
//  🏞️Illustration.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 12.06.2024.
//

import SwiftUI

struct Illustration: View {
    private var illustration: some View {
        Image(.illustration)
            .resizable()
            .scaledToFit()
    }
    
    private var slogan: some View {
        Text("Общайтесь с друзьями\n и близкими легко")
            .font(.headingSecond)
            .foregroundStyle(.neutral)
            .multilineTextAlignment(.center)
    }
    
    var body: some View {
        VStack {
            illustration
                .padding(EdgeInsets(top: 135, leading: 62, bottom: 42, trailing: 62))
            slogan
        }
    }
}

#Preview {
    Illustration()
}
