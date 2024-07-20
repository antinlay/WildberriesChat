//
//  WalkthroughView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 08.06.2024.
//

import SwiftUI

struct WalkthroughView: View {
    @State private var isPresentedVerification: Bool = false
    
    var body: some View {
        NavigationStack {
            IllustrationView()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea()
            VStack {
                PrivacyAndTermsView()
                Button {
                    isPresentedVerification = true
                } label: {
                    Text("Начать общаться")
                    .modifier(ActionButtonStyle())
                }
            }
            .padding()
            .navigationDestination(isPresented: $isPresentedVerification) {
                VerificationView()
            }
        }
    }
}

#Preview {
    WalkthroughView()
}

