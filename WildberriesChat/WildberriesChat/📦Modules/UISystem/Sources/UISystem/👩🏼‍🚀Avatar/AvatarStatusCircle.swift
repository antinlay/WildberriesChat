//
//  AvatarStatusCircle.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

public struct AvatarStatusCircle: View {
    public init() {}
    public var body: some View {
        Circle()
            .fill(Color("OnlineStatusColor", bundle: .main))
            .stroke(.white, lineWidth: 2)
            .frame(width: 14)
            .padding([.top, .trailing], -3)
    }
}
