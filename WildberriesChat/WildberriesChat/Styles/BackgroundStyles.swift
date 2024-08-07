//
//  BackgroundStyles.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

public struct InputBackgroundStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(.neutralReverse)
                    .frame(height: 36)
            )
    }
}

public struct AppBackgroundStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .background(ignoresSafeAreaEdges: .all)
        
    }
}
