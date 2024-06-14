//
//  AvatarView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI

struct AvatarView: View {
    private var contact = Contact()
//    @State var avatar: ImageResource? = contact.avatar
    
    var body: some View {
        thumbnail(.Avatars.petya)
            .storyBorder()
    }
}

#Preview {
    AvatarView()
}
