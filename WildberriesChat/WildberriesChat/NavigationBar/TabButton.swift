//
//  TabButton.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct TabButton: View {
    var image: ImageResource
    
    var body: some View {
        Rectangle()
            .fill(.clear)
            .frame(width: 32, height: 32)
            .overlay {
                Image(image)
                    .resizable()
                    .scaledToFit()
            }
    }
}

#Preview {
    TabButton(image: .NavigationBar.userGroup)
}
