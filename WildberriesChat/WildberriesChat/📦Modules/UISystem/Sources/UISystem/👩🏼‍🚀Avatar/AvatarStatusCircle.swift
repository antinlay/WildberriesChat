//
//  AvatarStatusCircle.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

public struct AvatarStatusCircle: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        ZStack(alignment: .topTrailing) {
            content
            Circle()
                .fill(Color("OnlineStatusColor", bundle: .main))
                .stroke(.white, lineWidth: 2)
                .frame(width: 14)
                .padding([.top, .trailing], -3)
        }
    }
}
