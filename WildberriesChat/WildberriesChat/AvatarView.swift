//
//  AvatarView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.06.2024.
//

import SwiftUI

struct AvatarView: View {
    var contact: Contact
        
    var body: some View {
        let initials = getInitials(from: contact.name)

        switch contact.avatar {
        case .some(let avatar):
            AvatarThumbnail(avatar: avatar)
        case .none:
            InitialsAvatar(initials: initials)
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
    AvatarView(contact: Contact.contacts.last!)
}
