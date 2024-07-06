//
//  PlaceholderAvatar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 17.06.2024.
//

import SwiftUI

struct PlaceholderAvatar: View {
    var body: some View {
        Circle()
            .fill(.neutralReverse)
            .overlay (
                Image(.person)
            )
            .frame(width: 200)
    }
}

#Preview {
    PlaceholderAvatar()
}
