//
//  CustomInput.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.08.2024.
//

import SwiftUI
import UISystem
import ExyteChat

struct CustomInput: View {
    @Binding var text: String
    
    let attachments: InputViewAttachments
    let inputViewStyle: InputViewStyle
    let inputViewState: InputViewState
    let inputViewActionClosure: (InputViewAction) -> Void
    
    var body: some View {
        Group {
            switch inputViewStyle {
            case .message: // input view on chat screen
                VStack {
                    HStack(spacing: 12) {
                        mediaButton
                        textField("Write a message...")
                        actionButton
                    }
                    .padding(.horizontal, 12)
                }
            case .signature: // input view on photo selection screen
                VStack {
                    HStack(spacing: 12) {
                        mediaButton
                        textField("Compose a signature for photo")
                        actionButton
                    }
                    .padding(.horizontal, 12)
                }
            }
        }
        .frame(height: 56)
        .background(.appBackground)
    }
}

extension CustomInput {
    @ViewBuilder
    private var replyContent: some View {
        if let reply = attachments.replyMessage {
            CustomReply(reply: reply, lineLimit: 1, isCurrentUser: false)
                .padding(.horizontal, 8)
                .padding(.top, 8)
        }
    }
    
    private var mediaButton: some View {
        Button {
            inputViewActionClosure(.photo)
        } label: {
            Image(.ToolBar.addContact)
                .foregroundColor(.storyBorder)
        }
    }
    
    private func textField(_ signature: String) -> some View {
        TextField(signature, text: $text)
            .modifier(InputTextField())
            .modifier(InputBackground())
    }
    
    private var actionButton: some View {
        Button {
            inputViewActionClosure(.send)
        } label: {
            Image(.Chat.sendButton)
        }
    }
}

//#Preview {
//    CustomInput()
//}
