//
//  ChatService.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.08.2024.
//

import SwiftUI
import ExyteChat
import AVFoundation

struct Chat {
    let id: String
    let contact: Contact
    var messages: [Message]
}

extension Chat {
    mutating func addNewMessage(newMessage: Message) {
        messages.append(newMessage)
    }
}

extension Chat {
    static var message0 = Message(id: "0", user: User.user, status: .sent, text: "Купил годзиллу")
    static var message1 = Message(id: "1", user: User.user0, status: .read, text: "Смотри че генерится :)", attachments: [Attachment(id: "0", url: URL(string: "https://s3-alpha-sig.figma.com/img/26d2/9648/4cbe94ce40bf3940fdf40e3d0a35203e?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VEb8RHwSwcyMQxtle3UqSjvPq3bYZfrll9CbJ9QwJ0AG1Nfl6FYJEbY5D0VIA2Zs9V1FvWnnL790UmF9E7GRi6foOs13gnGBqFLIm5BmGwfQIM2z3ixFl5dTPiLUziDlU1VpW4tcjmm8NjJZYjIp8TwBtKxvd7oiSGRvDCMuwVt4U0zb5sHI19ldjBv5H3QcgSSfMj53Jl8Yn9qytGhuE1qnKoROISvVvynGZT7hvYvMQN0QxEVtn~YQU2IsG3Q5ktxLX9kWdTjOTu2-kBnbY5KrMZaIPjF~NdUT5hyXeqqgStd-EVM6PE-F1QeVZzJD8BIvDlrlXvt32ei8lUYqZg__") ?? Bundle.current.url(forResource: nil, withExtension: nil)!, type: .image)])
    static var message2 = Message(id: "2", user: User.user0, status: .read, text: "Кайфы, как тебе?", replyMessage: message0.toReplyMessage())
    static var message3 = Message(id: "3", user: User.user, status: .read, text: "Годзилла топчик, позже запишу голосом")
    
    static var recordingMessage4: Recording {
        var record = Recording()
        record.url = URL(string: "https://www2.cs.uic.edu/~i101/SoundFiles/PinkPanther30.wav")
        record.convertAudioToWaveformSamples()
        return record
    }
    
    static var message4 = Message(id: "4", user: User.user, status: .read, recording: recordingMessage4)
    static var message5 = Message(id: "5", user: User.user0, text: "че каво")
    static var chat0 = Chat(id: "0", contact: Contact.contacts[safe: 0]!, messages: [message0, message1, message2, message3, message4, message5])
    static var chat1 = Chat(id: "1", contact: Contact.contacts[safe: 4]!, messages: [Message(id: "6", user: User.user4, text: "Как дела?")])
    static var chat2 = Chat(id: "2", contact: Contact.contacts[safe: 1]!, messages: [Message(id: "7", user: User.user, status: .read, text: "Петя - Годзилла"), Message(id: "8", user: User.user1, text: "Пон, прин")])
}

extension User {
    static var user = User(id: "000", name: "You", avatarURL: nil, isCurrentUser: true)
    static var user0 = Contact.contacts[safe: 0]!.toUser()
    static var user1 = Contact.contacts[safe: 1]!.toUser()
    static var user2 = Contact.contacts[safe: 2]!.toUser()
    static var user3 = Contact.contacts[safe: 3]!.toUser()
    static var user4 = Contact.contacts[safe: 4]!.toUser()
    static var user5 = Contact.contacts[safe: 5]!.toUser()
    
    
}

extension Recording {
    mutating func convertAudioToWaveformSamples() {
        if let url = self.url {
            do {
                let audioFile = try AVAudioFile(forReading: url)
                let format = audioFile.processingFormat
                let frameCount = AVAudioFrameCount(audioFile.length)
                let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: frameCount)
                
                try audioFile.read(into: buffer!)
                
                let channelData = buffer!.floatChannelData![0]
                let samples = Array(UnsafeBufferPointer(start: channelData, count: Int(buffer!.frameLength)))
                let waveformSamples = samples.map { CGFloat($0) }
                
                self.waveformSamples = waveformSamples
            } catch {
                print("Error converting audio to waveform samples: \(error.localizedDescription)")
                self.waveformSamples = []
            }
        }
    }
}
