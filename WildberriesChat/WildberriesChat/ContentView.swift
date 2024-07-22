//
//  ContentView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 06.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        FirstEntryView()
        WalkthroughView()
        //        OneTimePasswordView(countryCode: .constant("+7"), phoneNumber: .constant("9999999999"))
//                TabsView()
//                    .environment(SearchText())
    }
}

#Preview {
    ContentView()
        .environment(SearchText())
}
