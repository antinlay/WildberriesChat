//
//  TabBarView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: TabBottomBar
    
    var body: some View {            
        VStack {
            HStack {
                ForEach(TabBottomBar.allCases, id: \.self) { tab in
                    TabButtonView(image: tab.imageResource)
                        .foregroundStyle(selectedTab == tab ? .accent : .neutral)
                        .onTapGesture {
                            withAnimation {
                                selectedTab = tab
                            }
                        }
                    if tab != .more {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top)
        }
        .frame(maxWidth: .infinity, minHeight: 60)
        .shadow(color: Color(white: 0, opacity: 0.04), radius: 24, x: 0, y: -1)
    }
}

#Preview {
    let selectedTab: TabBottomBar = .contacts
    return TabBarView(selectedTab: .constant((selectedTab)) )
}
