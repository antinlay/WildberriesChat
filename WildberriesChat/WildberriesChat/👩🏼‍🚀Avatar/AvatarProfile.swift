//
//  AvatarProfile.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 17.06.2024.
//

import SwiftUI
import UISystem

struct AvatarProfile: View {
    var avatarURL: URL?

    @StateObject private var imageLoader = ImageLoader()

    var body: some View {
        switch avatarURL {
        case .some(let avatarURL):
            if let avatar = imageLoader.image {
                AvatarCircle(avatar: avatar)
            } else {
                AvatarPlaceholder()
                    .overlay {
                        ProgressView()
                    }
                    .onAppear {
                        imageLoader.load(from: avatarURL)
                    }
            }
        case .none:
            AvatarPlaceholder()
        }
    }
}

#Preview {
    AvatarProfile(avatarURL: Contact.contacts.first!.avatarURL)
}
