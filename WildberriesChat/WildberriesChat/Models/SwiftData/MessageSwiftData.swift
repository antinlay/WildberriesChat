//
//  MessageSwiftData.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 16.08.2024.
//

import SwiftData
import SwiftUI

@Model class MessageSwiftData {
    var id: String
    var user: UserSwiftData
    var status: String?
    var createdAt: Date

    var text: String
    var attachments: [AttachmentSwiftData]
    var recording: RecordingSwiftData?
    var replyMessage: ReplyMessageSwiftData?

    var triggerRedraw: UUID?

    init(id: String,
                user: UserSwiftData,
                status: String? = nil,
                createdAt: Date = Date(),
                text: String = "",
                attachments: [AttachmentSwiftData] = [],
                recording: RecordingSwiftData? = nil,
                replyMessage: ReplyMessageSwiftData? = nil) {

        self.id = id
        self.user = user
        self.status = status
        self.createdAt = createdAt
        self.text = text
        self.attachments = attachments
        self.recording = recording
        self.replyMessage = replyMessage
    }
}

@Model class RecordingSwiftData {
    var duration: Double
    var waveformSamples: [CGFloat]
    var url: URL?

    init(duration: Double = 0.0, waveformSamples: [CGFloat] = [], url: URL? = nil) {
        self.duration = duration
        self.waveformSamples = waveformSamples
        self.url = url
    }
}

@Model class ReplyMessageSwiftData {
    var id: String
    var user: UserSwiftData
    var createdAt: Date

    var text: String
    var attachments: [AttachmentSwiftData]
    var recording: RecordingSwiftData?

    init(id: String,
                user: UserSwiftData,
                createdAt: Date,
                text: String = "",
                attachments: [AttachmentSwiftData] = [],
                recording: RecordingSwiftData? = nil) {

        self.id = id
        self.user = user
        self.createdAt = createdAt
        self.text = text
        self.attachments = attachments
        self.recording = recording
    }
}

