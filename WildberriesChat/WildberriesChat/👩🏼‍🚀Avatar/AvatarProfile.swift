//
//  AvatarProfile.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 17.06.2024.
//

import SwiftUI
import UISystem

struct AvatarProfile: View {
    var contact: Contact

    @StateObject private var imageLoader = ImageLoader()
    
    @ViewBuilder private var avatarLoader: some View {
        let avatarURL = contact.avatarURL
        
        Group {
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

    var body: some View {
        if let imageData = contact.imageData, let avatar = UIImage(data: imageData) {
            AvatarCircle(avatar: avatar)
        } else {
            avatarLoader
        }
    }
}

#Preview {
    AvatarProfile(contact: Contact.contacts.first!)
}
