//
//  ChatContainer.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 17.08.2024.
//

import SwiftUI
import UISystem

struct ChatContainer: View {
    var contact: Contact
    var messageText: String
    var dateStatusText: String
    var unreadMessageCount: Int
    
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
    
    private var dateStatus: some View {
        Text(dateStatusText)
            .font(.metadataSecond)
            .foregroundStyle(.appGray)
            .frame(height: 20)
    }

    private var message: some View {
        Text(messageText)
            .font(.metadataFirst)
            .foregroundStyle(.appGray)
            .frame(height: 20)
    }
    
    private var messageCount: some View {
        ZStack {
            Circle().frame(width: 21, height: 20)
                .foregroundColor(.tagCircle)
            Text("\(unreadMessageCount)")
                .font(.metadataSecond)
                .fontWeight(.semibold)
                .foregroundStyle(.tagNumber)
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            avatar
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    name
                    Spacer()
                    dateStatus
                }
                HStack{
                    message
                    Spacer()
                    messageCount
                        .opacity(unreadMessageCount < 1 ? .zero : 1 )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, 12)
        }
        .frame(maxHeight: 56)
    }
}

#Preview {
    ChatContainer(contact: Contact.contacts.first!, messageText: "че каво", dateStatusText: "Сегодня", unreadMessageCount: 1)
}
