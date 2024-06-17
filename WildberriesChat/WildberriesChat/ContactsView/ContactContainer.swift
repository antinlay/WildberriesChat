//
//  ContactContainer.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI

struct ContactContainer: View {
    var contact: Contact
    
    var body: some View {
        HStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 18)
                .fill(.clear)
                .frame(width: 56, height: 56)
                .overlay(alignment: .center) {
                    AvatarView(contact: contact)
                        .if (contact.activeStories) { $0.storyBorder() }
                        .if (contact.onlineStatus == "Online") { $0.circleStatus() }
                }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(contact.name)
                    .font(FontStyles.bodyFirst)
                    .foregroundStyle(.neutral)
                    .frame(height: 24)
                Text(contact.onlineStatus)
                    .font(FontStyles.metadataFirst)
                    .foregroundStyle(.appGray)
                    .frame(height: 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, 12)
        }
        .frame(height: 56)
        .padding(.top)
        .padding(.bottom, 12)
        .padding(.horizontal, 24)
    }
}

#Preview {
    ContactContainer(contact: Contact.contacts.first!)
}
