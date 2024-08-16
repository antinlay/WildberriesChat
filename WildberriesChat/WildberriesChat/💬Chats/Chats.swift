//
//  Chats.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import ExyteChat
import SwiftUI
import UISystem


@Observable final class ChatViewModel {
    var messages: [Message] = []
    
    //    func send(draft: DraftMessage, user: User) {
    //        let newMessage = Message(id: UUID().uuidString, user: user, status: .sending, createdAt: Date.now, text: draft.text, attachments: [Attachment(id: UUID().uuidString, url: URL(string: <#T##String#>), type: <#T##AttachmentType#>)]
    //        messages.append(message)
    //    }
}

struct Chats: View {
    @State var contacts: [Contact] = Contact.contacts
    @State var chatViewModel = ChatViewModel()
    @State var messages: [Message] = []
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(contacts.filter { $0.activeStories == true }, id: \.id) { contact in
                        VStack {
                            ZStack {
                                AvatarStoryBorder()
                                Avatar(contact: contact)
                            }
                            Text(contact.firstName.components(separatedBy: " ").first ?? contact.firstName)
                                .font(.metadataSecond)
                        }
                    }
                }
            }
            .frame(height: 108)
            .padding(.horizontal, 24)
            Divider()
            SearchBar()
                .padding(.horizontal, 24)
                .padding(.vertical)
            
            //        ChatView(messages: messages) { draft in
            //            chatViewModel.send(draft: draft)
            //        }
        }
    }
}

#Preview {
    Chats()
        .environment(Search())
}
