//
//  AvatarCircle.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 17.06.2024.
//

import SwiftUI

public struct AvatarCircle: View {
    var avatar: UIImage
    
    public init(avatar: UIImage) {
        self.avatar = avatar
    }
    
    public var body: some View {
        Image(uiImage: avatar)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
    }
}
//
//#Preview {
//    AvatarCircle(avatar: .Avatars.maman)
//}
