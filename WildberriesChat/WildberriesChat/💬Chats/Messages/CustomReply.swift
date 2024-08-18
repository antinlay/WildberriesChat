//
//  CustomReply.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.08.2024.
//

import SwiftUI
import ExyteChat

struct CustomReply: View {
    var reply: ReplyMessage
    var lineLimit: Int
    var isCurrentUser: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            lineView
            
            VStack(alignment: .leading, spacing: 4) {
                userName
                
                userAttachments
                
                userTextMessage
            }
            .padding(8)
            
            Spacer()
        }
        .background(.divider)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .fixedSize(horizontal: false, vertical: true)
    }
}

extension CustomReply {
    private var lineView: some View {
        Rectangle()
            .foregroundColor(.replyAccent)
            .frame(width: 4)
    }
    
    private var userName: some View {
        Text(reply.user.name)
            .foregroundStyle(.replyAccent)
            .font(.metadataSecond)
            .fontWeight(.semibold)
    }
    
    @ViewBuilder
    private var userTextMessage: some View {
        if !reply.text.isEmpty {
            Text(reply.text)
                .font(.bodySecond)
                .foregroundStyle(.neutral)
                .lineLimit(lineLimit)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private var userAttachments: some View {
        if !reply.attachments.isEmpty {
            ForEach(reply.attachments, id: \.id) { attachment in
                CustomAttachment(attachment: attachment,
                                    imageSize: CGSize(width: 150, height: 262),
                                    cornerRadius: 4
                )
            }
        }
    }
}

#Preview {
    CustomReply(reply: Message.message0.toReplyMessage(), lineLimit: 5, isCurrentUser: true)
}
