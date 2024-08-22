//
//  ChatContainer.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 17.08.2024.
//

import SwiftUI
import UISystem
import ExyteChat

struct ChatContainer: View {
    @Binding var chat: Chat

    @ViewBuilder private var avatar: some View {
        let contact = chat.contact
        
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
    
    @ViewBuilder private var name: some View {
        let contact = chat.contact
        
        Text(contact.firstName)
            .font(.bodyFirst)
            .foregroundStyle(.neutral)
            .frame(height: 24)
    }
    
    @ViewBuilder private var dateStatus: some View {
//        let messages = chat.messages
        
        Text("Today")
            .font(.metadataSecond)
            .foregroundStyle(.appGray)
            .frame(height: 20)
    }
    
    @ViewBuilder private var message: some View {
        let message = chat.messages.last
        
        Text(message?.text ?? "Send your first message...")
            .font(.metadataFirst)
            .foregroundStyle(.appGray)
            .frame(height: 20)
    }
    
    @ViewBuilder private var messageCount: some View {
        let messages = chat.messages
        let unreadMessageCount = messages.filter { $0.status != .read }.count
        
        ZStack {
            Circle().frame(width: 21, height: 20)
                .foregroundColor(.tagCircle)
            Text("\(unreadMessageCount)")
                .font(.metadataSecond)
                .fontWeight(.semibold)
                .foregroundStyle(.tagNumber)
        }
        .opacity(unreadMessageCount < 1 ? .zero : 1 )
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
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, 12)
        }
        .frame(maxHeight: 56)
    }
}

#Preview {
    ChatContainer(chat: .constant(.chat0))
}
