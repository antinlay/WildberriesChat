//
//  AvatarPlaceholder.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 17.06.2024.
//

import SwiftUI

public struct AvatarPlaceholder: View {
    public init() {}
    public var body: some View {
        Circle()
            .fill(Color("NeutralReverseColor", bundle: .main))
            .overlay (
                Image(ImageResource(name: "Person", bundle: .main))
            )
            .frame(width: 200)
    }
}

#Preview {
    AvatarPlaceholder()
}
