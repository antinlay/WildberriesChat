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
            
//            recordingView
            
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
                                    imageSize: CGSize(width: 150, height: 262),
                                    cornerRadius: 4
                )
            }
        }
    }
    
    
//    @ViewBuilder
//    private var recordingView: some View {
//        if let recording = message.recording {
//            RecordWaveView(
//                recording: recording,
//                colorButton: message.user.isCurrentUser ? Color.white : Color.theme.active,
//                colorWaveform: message.user.isCurrentUser ? Color.white : Color.theme.active
//            )
//            .padding(Constants.recordingPadding)
//            .background(replyBackgroundColor)
//            .clipShape(RoundedRectangle(cornerRadius: 4))
//        }
//    }
    
    private var createdAtView: some View {
        Text("\(message.time) · \(messageStatusText)")
            .foregroundColor(timeColor)
            .font(.caption2)
    }
}

extension Message {
    var time: String {
        DateFormatter.timeFormatter.string(from: createdAt)
    }
}

extension DateFormatter {
    static let timeFormatter = {
        let formatter = DateFormatter()

        formatter.dateStyle = .none
        formatter.timeStyle = .short

        return formatter
    }()

    static let relativeDateFormatter = {
        let relativeDateFormatter = DateFormatter()
        relativeDateFormatter.timeStyle = .none
        relativeDateFormatter.dateStyle = .full
        relativeDateFormatter.locale = Locale(identifier: "en_US")
        relativeDateFormatter.doesRelativeDateFormatting = true

        return relativeDateFormatter
    }()

    static func timeString(_ seconds: Int) -> String {
        let hour = Int(seconds) / 3600
        let minute = Int(seconds) / 60 % 60
        let second = Int(seconds) % 60

        if hour > 0 {
            return String(format: "%02i:%02i:%02i", hour, minute, second)
        }
        return String(format: "%02i:%02i", minute, second)
    }
}

#Preview {
    CustomMessage(message: Message.message2, positionInGroup: .single)
}

#Preview("Dark") {
    CustomMessage(message: Message.message2, positionInGroup: .single)
        .preferredColorScheme(.dark)
}
