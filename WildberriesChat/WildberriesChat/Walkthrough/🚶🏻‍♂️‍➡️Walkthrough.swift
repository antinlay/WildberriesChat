//
//  🚶🏻‍♂️‍➡️Walkthrough.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 08.06.2024.
//

import SwiftUI
import UISystem

struct Walkthrough: View {
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            Illustration()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea()
            VStack {
                PrivacyAndTerms()
                Button("Начать общаться") {
                    router.navigate(to: OnBoardingRoutes.verification)
                }
                .buttonStyle(ActionButton(isDisabled: false))
                .padding(.top, 13)
            }
            .padding()
        }
        .modifier(AppBackground())
    }
}

#Preview {
    Walkthrough()
        .environment(Router())
}

#Preview {
    Walkthrough()
        .environment(Router())
        .preferredColorScheme(.dark)
}
