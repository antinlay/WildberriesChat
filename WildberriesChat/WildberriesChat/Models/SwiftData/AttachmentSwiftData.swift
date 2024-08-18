//
//  AttachmentSwiftData.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 16.08.2024.
//

import Foundation
import SwiftData

@Model class AttachmentSwiftData {
    let id: String
    let thumbnail: URL
    let full: URL
    let type: String

    init(id: String, thumbnail: URL, full: URL, type: String) {
        self.id = id
        self.thumbnail = thumbnail
        self.full = full
        self.type = type
    }

    convenience init(id: String, url: URL, type: String) {
        self.init(id: id, thumbnail: url, full: url, type: type)
    }
}
