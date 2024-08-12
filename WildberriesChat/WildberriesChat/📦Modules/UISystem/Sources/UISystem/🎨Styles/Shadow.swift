//
//  Shadow.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 09.08.2024.
//

import SwiftUI

public struct BorderShadow: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .shadow(color: Color("BorderShadowColor", bundle: .main), radius: 24, x: 0, y: -1)
    }
}
