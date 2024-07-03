//
//  WildberriesChatWidgetBundle.swift
//  WildberriesChatWidget
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import WidgetKit
import SwiftUI

@main
struct WildberriesChatWidgetBundle: WidgetBundle {
    var body: some Widget {
        WildberriesChatWidget()
        WildberriesChatWidgetControl()
        WildberriesChatWidgetLiveActivity()
    }
}
