//
//  TabButtonView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct TabButtonView: View {
    var image: ImageResource
    @Binding var selectedTab: ImageResource

    var body: some View {
//        Button {
//            withAnimation {
//                selectedTab = image
//            }
//        } label: {
//            Rectangle()
//                .fill(.clear)
//                .frame(width: 32, height: 32)
//                .overlay {
//                    Image(image)
//                        .resizable()
//                        .scaledToFit()
//                        .foregroundStyle(selectedTab == image ? .accent : .neutral)
//                }
//        }
        
        Rectangle()
            .fill(.clear)
            .frame(width: 32, height: 32)
            .overlay {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(selectedTab == image ? .accent : .neutral)
            }
            .onTapGesture {
                withAnimation {
                    selectedTab = image
                }
            }
    }
}

#Preview {
    TabButtonView(image: .NavigationBar.userGroup, selectedTab: .constant(.NavigationBar.userGroup))
}
