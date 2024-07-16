//
//  CircleAvatar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 17.06.2024.
//

import SwiftUI

struct CircleAvatar: View {
    var contact: Contact

    var body: some View {
        switch contact.avatar {
        case .some(let avatar):
            ProfileAvatar(avatar: avatar)
        case .none:
            PlaceholderAvatar()
        }
    }
}

#Preview {
    CircleAvatar(contact: Contact.contacts.first!)
}
