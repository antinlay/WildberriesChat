//
//  Background.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

public struct InputBackground: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color("NeutralReverseColor", bundle: .main))
                    .frame(height: 36)
            )
    }
}

public struct AppBackground: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        ZStack {
            Color("AppBackgroundColor", bundle: .main).ignoresSafeArea()
            content
        }
    }
}
