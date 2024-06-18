//
//  TabBarView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct TabBarView: View {
    static let tabs: [ImageResource] = [.NavigationBar.userGroup, .NavigationBar.messageCircle, .NavigationBar.moreHorizontal]
    @State var selectedTab: ImageResource
    
    var body: some View {            
        VStack {
            HStack {
                ForEach(TabBarView.tabs.indices, id: \.self) { index in
                    TabButtonView(image: TabBarView.tabs[index], selectedTab: $selectedTab)
                    if index != TabBarView.tabs.count - 1 {
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
    TabBarView(selectedTab: .NavigationBar.userGroup)
}
