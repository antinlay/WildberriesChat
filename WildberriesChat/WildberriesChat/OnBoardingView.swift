//
//  OnBoardingView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 08.06.2024.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            VStack {
                Image(.illustration)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding()
                Text("Общайтесь с друзьями и близкими легко")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.neutral)
                    .multilineTextAlignment(.center)
                    .frame(width: 280.0, height: 58.0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                Button("Пользовательское соглашение") {
                    isPresented = true
                }
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.neutral)
                .sheet(isPresented: $isPresented, content: {
                    UserAgreementView()
                        .presentationBackground(.thinMaterial)
                })
                
                NavigationLink("Начать общаться", destination: UserAgreementView())
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(.accent)
                    .clipShape(.capsule)
                    .padding(EdgeInsets(top: 12, leading: 6, bottom: 12, trailing: 6))
                    .foregroundStyle(.white)
                
            }
            .padding()
        }
    }
}

#Preview {
    OnBoardingView()
}

