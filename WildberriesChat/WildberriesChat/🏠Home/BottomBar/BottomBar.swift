//
//  BottomBar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI
import UISystem

struct BottomBar: View {
    @Binding var selectedTab: BottomBarRoutes
    
    private var bottomBarButtons: some View {
        HStack {
            ForEach(BottomBarRoutes.allCases, id: \.self) { tab in
                BottomBarButton(image: tab.imageResource)
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
    }
    
    var body: some View {
        Rectangle()
            .fill(.appBackground)
            .frame(maxHeight: 83)
            .modifier(BorderShadow())
            .overlay(
                bottomBarButtons
                    .padding(.horizontal, 24)
            )
    }
}

#Preview {
    let selectedTab: BottomBarRoutes = .contacts
    return BottomBar(selectedTab: .constant((selectedTab)) )
}

#Preview {
    let selectedTab: BottomBarRoutes = .contacts
    return BottomBar(selectedTab: .constant((selectedTab)) ).preferredColorScheme(.dark)
}
