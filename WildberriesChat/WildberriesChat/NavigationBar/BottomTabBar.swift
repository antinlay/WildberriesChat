//
//  BottomTabBar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct BottomTabBar: View {
    @Binding var selectedTab: BottomBarRoutes
    
    var body: some View {            
        VStack {
            HStack {
                ForEach(BottomBarRoutes.allCases, id: \.self) { tab in
                    TabButton(image: tab.imageResource)
                        .foregroundStyle(selectedTab == tab ? .accent : .neutral)
                        .onTapGesture {
                            withAnimation {
                                selectedTab = tab
                            }
                        }
                    if tab != .more {
                        Spacer()
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
    let selectedTab: BottomBarRoutes = .contacts
    return BottomTabBar(selectedTab: .constant((selectedTab)) )
}
