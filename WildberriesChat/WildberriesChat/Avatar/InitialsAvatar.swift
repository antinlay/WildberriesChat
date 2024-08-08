//
//  InitialsAvatar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

struct InitialsAvatar: View {
    var initials: String
    
    var body: some View {
            RoundedRectangle(cornerRadius: 16)
                .fill(.accent)
                .frame(width: 48, height: 48)
                .overlay {
                    Text(initials)
                        .font(.bodyFirst)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                }
    }
}

#Preview {
    InitialsAvatar(initials: "BB")
}
