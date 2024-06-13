//
//  ContentView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 06.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        NavigationStack {
//            OnBoardingView()
//                .background(.appBackground)
//        }
        TabView {
            ContactsView()
                .tabItem {
                    Image(.BottomBar.userGroup)
                }
            OnBoardingView()
                .tabItem {
                    Image(.BottomBar.messageCircle)
                }
            UserAgreementView()
                .tabItem {
                    Image(.BottomBar.moreHorizontal)
                }
        }
        .tint(.accent)
        .background(.appBackground)
    }
}

#Preview {
    ContentView()
}
