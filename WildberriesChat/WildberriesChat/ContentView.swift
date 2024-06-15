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
                ContactsView()
                    .searchView(searchText)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Контакты")
                                .font(FontStyles.subheadingFirst)
                                .padding(.leading, 12)
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Text("+")
                                .font(FontStyles.subheadingFirst)
                                .padding(.trailing, 12)
                        }
                    }
                
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
