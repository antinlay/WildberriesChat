//
//  AvatarThumbnail.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

struct AvatarThumbnail: View {
    var avatar: ImageResource
    
    var body: some View {
        Image(avatar)
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipShape(.rect(cornerRadius: 16))
    }
    
}

#Preview {
    AvatarThumbnail(avatar: .Avatars.anastasiya)
}
