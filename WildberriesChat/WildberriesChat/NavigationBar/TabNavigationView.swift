//
//  TabNavigationView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct TabNavigationView: View {
    static let tabs: [ImageResource] = [.NavigationBar.userGroup, .NavigationBar.messageCircle, .NavigationBar.moreHorizontal]
    @State var selectedTab: ImageResource
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ContactsView().tag(TabNavigationView.tabs[0])
            MessagesView().tag(TabNavigationView.tabs[1])
            MoreView().tag(TabNavigationView.tabs[2])
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .toolbar{
            ToolBarView(selectedTab: selectedTab)
        }
        
        VStack {
            HStack {
                ForEach(TabNavigationView.tabs.indices, id: \.self) { index in
                    TabButtonView(image: TabNavigationView.tabs[index], selectedTab: $selectedTab)
                    if index != TabNavigationView.tabs.count - 1 {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top)
        }
        .frame(maxWidth: .infinity, minHeight: 60)
        .ignoresSafeArea(.all, edges: [.bottom, .horizontal])
        .background(.appBackground)
        .shadow(color: Color(white: 0, opacity: 0.04), radius: 24, x: 0, y: -1)
    }
}

#Preview {
    TabNavigationView(selectedTab: .NavigationBar.userGroup)
}
