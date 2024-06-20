//
//  ChatWidgetBundle.swift
//  ChatWidget
//
//  Created by Janiece Eleonour on 20.06.2024.
//

import WidgetKit
import SwiftUI

@main
struct ChatWidgetBundle: WidgetBundle {
    var body: some Widget {
        ChatWidget()
        ChatWidgetLiveActivity()
    }
}
