//
//  AvatarThumbnail.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

public struct AvatarThumbnail: View {
    var avatar: UIImage
    var width: CGFloat?
    var height: CGFloat?
    var cornerRadius: CGFloat?
    
    public init(avatar: UIImage, width: CGFloat? = nil, height: CGFloat? = nil, cornerRadius: CGFloat? = nil) {
        self.avatar = avatar
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }
    
    public var body: some View {
        Image(uiImage: avatar)
            .resizable()
            .scaledToFill()
            .frame(width: width ?? 48, height: height ?? 48)
            .clipShape(.rect(cornerRadius: cornerRadius ?? 16))
    }
}

//#Preview {
//    AvatarThumbnail(avatar: .Avatars.anastasiya)
//}
