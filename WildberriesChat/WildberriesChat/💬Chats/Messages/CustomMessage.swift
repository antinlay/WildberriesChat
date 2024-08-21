//
//  CustomMessage.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.08.2024.
//

import SwiftUI
import ExyteChat

struct CustomMessage: View {
    var message: Message
    var positionInGroup: PositionInUserGroup
    var isCurrentUser: Bool {
        message.user.isCurrentUser
    }
    
    var topPadding: CGFloat {
        positionInGroup == .single || positionInGroup == .first ? 12 : 6
    }
    
    var bottomPadding: CGFloat {
        positionInGroup == .single || positionInGroup == .last ? 12 : 6
    }
    
    var messageAlignment: Alignment {
        isCurrentUser ? .trailing : .leading
    }
    
    var messageContentAlignment: HorizontalAlignment {
        isCurrentUser ? .trailing : .leading
    }
    
    var textAlignment: TextAlignment {
        isCurrentUser ? .trailing : .leading
    }
    
    var leadingPadding: CGFloat {
        isCurrentUser ? 77 : 16
    }
    
    var trailingPadding: CGFloat {
        isCurrentUser ? 16 : 77
    }
    
    var leadingCornerRadius: CGFloat {
        isCurrentUser ? 16 : 0
    }
    
    var trailingCornerRadius: CGFloat {
        isCurrentUser ? 0 : 16
    }
    
    var textColor: Color {
        isCurrentUser ? .white : .neutral
    }
    
    var timeColor: Color {
        isCurrentUser ? .white : .storyBorder
    }
    
    var replyLineColor: Color {
        isCurrentUser ? .white : .black
    }
        
    var backgroundColor: Color {
        isCurrentUser ? .accent : .appBackground
    }
    
    var messageStatusText: String {
        switch message.status {
        case .sending: "Sending"
        case .sent: "Sent"
        case .read: "Read"
        default: "Error"
        }
    }
    
    var body: some View {
        VStack(alignment: messageContentAlignment, spacing: 12) {
            replyMessage
            
            imagesView
            
            recordingView
            
            textView
            
            createdAtView
        }
        .scaledToFit()
        .padding(10)
        .background(backgroundColor)
            .clipShape(.rect(topLeadingRadius: 16,
                            bottomLeadingRadius: 16,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 16))
            .padding(.top, topPadding)
            .padding(.bottom, bottomPadding)
            .padding(.leading, leadingPadding)
            .padding(.trailing, trailingPadding)
            .frame(maxWidth: .infinity, alignment: messageAlignment)

            .foregroundStyle(message.user.isCurrentUser ? .accent : .appBackground)
    }
}

extension CustomMessage {
    @ViewBuilder
    private var replyMessage: some View {
        if let reply = message.replyMessage {
            CustomReply(reply: reply,
                             lineLimit: 10,
                             isCurrentUser: isCurrentUser
            )
        }
    }
    
    @ViewBuilder
    private var textView: some View {
        if !message.text.isEmpty {
            Text(message.text)
                .foregroundColor(textColor)
                .font(.bodySecond)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    @ViewBuilder
    private var imagesView: some View {
        if !message.attachments.isEmpty {
            ForEach(message.attachments, id: \.id) { attachment in
                CustomAttachment(attachment: attachment,
                                    imageSize: CGSize(width: 262, height: 150),
                                    cornerRadius: 4
                )
            }
        }
    }
    
    
    @ViewBuilder
    private var recordingView: some View {
        if message.recording != nil {
            CustomRecord()
            .padding()
            .background(.accent)
            .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
    
    
    private var createdAtView: some View {
        Text("\(message.time) · \(messageStatusText)")
            .foregroundColor(timeColor)
            .font(.caption2)
    }
}


#Preview {
    CustomMessage(message: Message.message4, positionInGroup: .single)
}

#Preview("Dark") {
    CustomMessage(message: Message.message4, positionInGroup: .single)
        .preferredColorScheme(.dark)
}
