//
//  AvatarThumbnail.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

public struct AvatarThumbnail: ViewModifier {
    static func thumbnail(_ imageResuorce: ImageResource) -> some View {
        Image(imageResuorce)
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipShape(.rect(cornerRadius: 16))
    }
    
    public func body(content: Content) -> some View {
        content
    }
}

extension View {
    func thumbnail(_ imageResuorce: ImageResource) -> some View {
        Image(imageResuorce)
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipShape(.rect(cornerRadius: 16))
    }

}
