//
//  🕵🏻‍♂️PrivacyAndTerms.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 12.06.2024.
//

import SwiftUI

struct PrivacyAndTerms: View {
    @State private var isPolicyPresented = false
    @State private var isTermsPresented = false
    
    var body: some View {
        Text("Нажимая кнопку продолжить я соглашаюсь с ")
            .font(.metadataSecond)
            .foregroundStyle(.appGray)
            .padding(2)
        HStack(spacing: 0) {
            Text("Политикой Конфиденциальности")
                .font(.metadataSecond)
                .foregroundStyle(.accent)
                .onTapGesture {
                    isPolicyPresented = true
                }
                .sheet(isPresented: $isTermsPresented, content: {
                    UserAgreement()
                        .presentationBackground(.thinMaterial)
                })
            Text(" и ")
                .font(.metadataSecond)
                .foregroundStyle(.appGray)
            Text("Условиями Использования")
                .font(.metadataSecond)
                .foregroundColor(.accent)
                .onTapGesture {
                    isTermsPresented = true
                }
                .sheet(isPresented: $isPolicyPresented, content: {
                    UserAgreement()
                        .presentationBackground(.thinMaterial)
                })
        }
    }
}

#Preview {
    PrivacyAndTerms()
}
