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
                        .padding(.horizontal, 24)
                        .padding(.vertical)
                    ContactsView()
                }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Контакты")
                                .font(FontStyles.subheadingFirst)
                                .padding(.leading, 10)
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Image(.ToolBar.addContact)
                                .font(FontStyles.headingSecond)
                                .padding(.trailing, 10)
                        }
                    }
                    .background(.appBackground)
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
