//
//  ⚪️CodeTextField.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.07.2024.
//

import SwiftUI

struct CodeTextField: View {
    @State private var code: String = ""
    @FocusState private var isCodeFocused: Bool
    
    var limit: Int = 4
        
    var body: some View {
        HStack(spacing: 48) {
            ForEach(0..<limit, id:\.self) { index in
                let digits = Array(code)
                ZStack {
                    Circle()
                        .frame(width: 32)
                        .foregroundColor(.inputGray)
                        .opacity(digits.count > index ? .zero : 1)
                    if let text = digits[safe: index] {
                        Text("\(text)")
                            .font(FontStyles.headingFirst)
                            .multilineTextAlignment(.center)
                    }
                }
                .animation(.easeOut, value: digits.count > index)
                .onTapGesture {
                    isCodeFocused = true
                }
            }
        }
        .background {
            TextField("", text: $code)
                .opacity(.zero)
                .keyboardType(.numberPad)
                .focused($isCodeFocused)
        }
    }
}

#Preview {
    CodeTextField()
}
