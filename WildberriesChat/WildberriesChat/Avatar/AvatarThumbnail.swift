//
//  AvatarThumbnail.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

struct AvatarThumbnail: View {
    var avatar: ImageResource
    var width: CGFloat?
    var height: CGFloat?
    var cornerRadius: CGFloat?
    
    var body: some View {
        Image(avatar)
            .resizable()
            .scaledToFill()
            .frame(width: width ?? 48, height: height ?? 48)
            .clipShape(.rect(cornerRadius: cornerRadius ?? 16))
    }
}

#Preview {
    AvatarThumbnail(avatar: .Avatars.anastasiya)
}
