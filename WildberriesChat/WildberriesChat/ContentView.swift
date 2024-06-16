//
//  ContentView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 06.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            TabView {
                VStack {
                    SearchBarView(searchText: $searchText)
                        .padding()
                    ContactsView()
                }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Контакты")
                                .font(FontStyles.subheadingFirst)
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Image(.ToolBar.addContact)
                                .font(FontStyles.headingSecond)
                        }
                    }.padding(.bottom)
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
        }
        
        .tint(.accent)
        .background(.appBackground)
    }
}

#Preview {
    ContentView()
}
