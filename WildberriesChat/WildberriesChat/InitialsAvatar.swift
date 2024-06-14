//
//  InitialsAvatar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

struct InitialsAvatar: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.accent)
                .frame(width: 48, height: 48)
            Text("ИИ")
                .font(FontStyles.bodyFirst)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    InitialsAvatar()
}
