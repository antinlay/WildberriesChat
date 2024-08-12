//
//  ContactContainer.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI
import UISystem

struct ContactContainer: View {
    var contact: Contact
    
    private var avatar: some View {
        RoundedRectangle(cornerRadius: 18)
            .fill(.clear)
            .frame(width: 56, height: 56)
            .overlay(alignment: .center) {
                AvatarStoryBorder()
                    .opacity(contact.activeStories ? 1 : .zero)
                ZStack(alignment: .topTrailing) {
                    Avatar(contact: contact)
                    AvatarStatusCircle()
                        .opacity(contact.onlineStatus == "Online" ? 1 : .zero)
                }
            }
    }
    
    private var name: some View {
        Text(contact.firstName)
            .font(.bodyFirst)
            .foregroundStyle(.neutral)
            .frame(height: 24)
    }
    
    private var status: some View {
        Text(contact.onlineStatus)
            .font(.metadataFirst)
            .foregroundStyle(.appGray)
            .frame(height: 20)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            avatar
            VStack(alignment: .leading, spacing: 2) {
                name
                status
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, 12)
        }
        .frame(maxHeight: 56)
    }
}

#Preview {
    ContactContainer(contact: Contact.contacts.last!)
}
