//
//  OnBoardingView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 08.06.2024.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        VStack {
            IllustrationView()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea()
            VStack {
                PrivacyAndTermsView()
                NavigationLink("Начать общаться", destination: UserAgreementView())
                    .actionButton()
            }
            .padding()
        }
    }
}

#Preview {
    OnBoardingView()
}

