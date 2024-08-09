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

    var body: some View {
        switch contact.avatar {
        case .some(let avatar):
            AvatarCircle(avatar: avatar)
        case .none:
            AvatarPlaceholder()
        }
    }
}

#Preview {
    AvatarProfile(contact: Contact.contacts.first!)
}
