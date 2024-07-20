//
//  PrivacyAndTermsView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 12.06.2024.
//

import SwiftUI

struct PrivacyAndTermsView: View {
    @State private var isPolicyPresented = false
    @State private var isTermsPresented = false
    
    var body: some View {
        Text("Нажимая кнопку продолжить я соглашаюсь с ")
            .font(FontStyles.metadataSecond)
            .foregroundStyle(.appGray)
            .padding(2)
        HStack(spacing: 0) {
            Text("Политикой Конфиденциальности")
                .font(FontStyles.metadataSecond)
                .foregroundStyle(.accent)
                .onTapGesture {
                    isPolicyPresented = true
                }
                .sheet(isPresented: $isTermsPresented, content: {
                    UserAgreementView()
                        .presentationBackground(.thinMaterial)
                })
            Text(" и ")
                .font(FontStyles.metadataSecond)
                .foregroundStyle(.appGray)
            Text("Условиями Использования")
                .font(FontStyles.metadataSecond)
                .foregroundColor(.accent)
                .onTapGesture {
                    isTermsPresented = true
                }
                .sheet(isPresented: $isPolicyPresented, content: {
                    UserAgreementView()
                        .presentationBackground(.thinMaterial)
                })
        }
    }
}

#Preview {
    PrivacyAndTermsView()
}
