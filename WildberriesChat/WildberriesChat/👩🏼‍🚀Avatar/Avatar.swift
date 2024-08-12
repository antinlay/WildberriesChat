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
        
    var body: some View {
        let initials = getInitials(from: contact.name)

        switch contact.avatar {
        case .some(let avatar):
            AvatarThumbnail(avatar: avatar)
                .clipShape(.rect(cornerRadius: 16))
        case .none:
            AvatarContactInitials(initials: initials)
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
