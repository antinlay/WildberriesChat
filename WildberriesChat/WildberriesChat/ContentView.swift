//
//  ContentView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 06.06.2024.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        OneTimePasswordView(countryCode: .constant("+7"), phoneNumber: .constant("9991234567"))
//        NavigationStackView()
//            .environmentObject(Router())
//            .environmentObject(SearchText())
    }
}

#Preview {
    ContentView()
}
