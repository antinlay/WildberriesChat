//
//  WalkthroughView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 08.06.2024.
//

import SwiftUI

struct WalkthroughView: View {
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            IllustrationView()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea()
            VStack {
                PrivacyAndTermsView()
                Button {
                    router.navigate(to: .verification)
                } label: {
                    Text("Начать общаться")
                        .modifier(ActionButtonStyle())
                }
            }
            .padding()
        }
        .background(.appBackground, ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    WalkthroughView()
        .environment(Router())
}

#Preview {
    WalkthroughView()
        .environment(Router())
        .preferredColorScheme(.dark)
}