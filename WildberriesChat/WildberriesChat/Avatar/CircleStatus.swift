//
//  CircleStatus.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

public struct CircleStatus: ViewModifier {
    public func body(content: Content) -> some View {
        ZStack(alignment: .topTrailing) {
            content
            Circle()
                .fill(.onlineStatus)
                .stroke(.white, lineWidth: 2)
                .frame(width: 14)
                .padding([.top, .trailing], -3)
        }
    }
}

extension View {
    func circleStatus() -> some View {
        modifier(CircleStatus())
    }
}
