//
//  WildberriesChatApp.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 06.06.2024.
//

import SwiftUI

@main
struct WildberriesChatApp: App {
    @StateObject private var defaultStorage = DefaultStorage()
    @State private var router = Router()
    @State private var otp = OneTimePassword()
    @State private var search = Search()
    @State private var kandinsky = KandinskyImageGeneration()
    @State private var chatViewModel = ChatViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navigationPath) {
                ContentView()
            }
            .environment(router)
            .environment(otp)
            .environment(search)
            .environment(kandinsky)
            .environmentObject(defaultStorage)
            .environmentObject(chatViewModel)
        }
    }
}
