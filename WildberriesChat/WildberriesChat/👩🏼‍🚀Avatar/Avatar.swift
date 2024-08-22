//
//  Avatar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.06.2024.
//

import SwiftUI
import UISystem

struct Avatar: View {
    var contact: Contact
    @StateObject private var imageLoader = ImageLoader()
    
    @ViewBuilder private var avatarLoader: some View {
        let initials = getInitials(from: contact.firstName)
        
        Group {
            switch contact.avatarURL {
            case .some(let avatarURL):
                if let avatar = imageLoader.image {
                    AvatarThumbnail(avatar: avatar)
                        .clipShape(.rect(cornerRadius: 16))
                } else {
                    AvatarContactInitials(initials: initials)
                        .overlay {
                            ProgressView()
                        }
                        .onAppear {
                            imageLoader.load(from: avatarURL)
                        }
                }
            case .none:
                AvatarContactInitials(initials: initials)
            }
        }
    }
    
    var body: some View {
        if let imageData = contact.imageData, let avatar = UIImage(data: imageData) {
            AvatarThumbnail(avatar: avatar)
                .clipShape(.rect(cornerRadius: 16))
        } else {
            avatarLoader
        }
    }
    
}

extension View {
    func getInitials(from name: String) -> String {
        var initials = String()
        name.components(separatedBy: .whitespaces).forEach { word in
            initials += word.prefix(1)
        }
        return initials
    }
}

#Preview {
    Avatar(contact: Contact.contacts.first!)
}
