//
//  AvatarProfile.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 17.06.2024.
//

import SwiftUI
import UISystem

struct AvatarProfile: View {
    var uiImage: UIImage?

    var body: some View {
        switch uiImage {
        case .some(let avatar):
            AvatarCircle(avatar: avatar)
        case .none:
            AvatarPlaceholder()
        }
    }
}

#Preview {
    AvatarProfile(uiImage: Contact.contacts.first!.avatar)
}
