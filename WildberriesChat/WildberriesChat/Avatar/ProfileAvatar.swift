//
//  ProfileAvatar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 17.06.2024.
//

import SwiftUI

struct ProfileAvatar: View {
    var avatar: ImageResource
    
    var body: some View {
        Image(avatar)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
    }
}

#Preview {
    ProfileAvatar(avatar: .Avatars.maman)
}
