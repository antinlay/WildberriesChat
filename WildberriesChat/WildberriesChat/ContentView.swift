//
//  ContentView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 06.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Image(.illustration)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            Text("Общайтесь с друзьями и близкими легко")
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
                .frame(width: 280.0, height: 58.0)
            Spacer()
            Text("Польззовательское соглашение")
                .padding()
            Button("Начать общаться") {
                isPresented = true
            }
            .background(.accent)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(EdgeInsets(top: 12, leading: 48, bottom: 12, trailing: 48))
            .foregroundStyle(.white)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
