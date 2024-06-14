//
//  ContactContainer.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI

struct ContactContainer: View {
    private var contact = Contact.contacts.first { contact in
        contact.name.contains("Иван Иванов")
    }
    //    @State var avatar: ImageResource? = contact.avatar
    
    var body: some View {
        let initials = getInitials(from: contact!.name)
        let avatar = contact!.avatar
        let activeStories = contact!.activeStories
        let onlineStatus = contact!.onlineStatus
        
        HStack {
            getavatar(avatar, initials)
                .if (activeStories) { $0.storyBorder() }
                .if (onlineStatus == "Online") { $0.circleStatus() }
                .padding(.leading, 24)

            VStack(alignment: .leading, spacing: 2) {
                Text(contact!.name)
                    .font(FontStyles.bodyFirst)
                    .foregroundStyle(.neutral)
                    .frame(height: 24)
                Text(contact!.onlineStatus)
                    .font(FontStyles.metadataFirst)
                    .foregroundStyle(.appGray)
                    .frame(height: 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, 12)
        }
        .frame(height: 56)
    }
}

extension View {
    func getInitials(from name: String) -> String {
        var initials = ""
        
        name.components(separatedBy: .whitespaces).forEach { word in
            initials += Array(arrayLiteral: word)[0]
        }
        
        return initials
    }
    
    func getavatar(_ avatar: ImageResource?, _ initials: String) -> any View {
        if let avatar = avatar {
            return thumbnail(avatar)
        } else {
            return initialsAvatar(initials)
        }
    }
}

#Preview {
    ContactContainer()
}
