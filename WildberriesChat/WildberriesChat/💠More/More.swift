//
//  More.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI
import UISystem

struct More: View {
    @State private var isError: Bool = false
    @State private var statusCodeText: Int = 0
    @State private var query = ""
    @State private var response = ""
    private var kandinsky = KandinskyImageGeneration()
    
    var body: some View {
        VStack {
            Button {
                Task {
//                    if !query.isEmpty {
//                        await kandinsky.generateQuery(parameters: KandinskyParameters(generateParams: .init(query: query)))
//                        response = await kandinsky.uuid
//                    }
                }
            } label: {
                Text("GENERATE")
            }
            TextField("Prompt", text: $query)
                .padding()
            Text("More \(response)")
                .onAppear {
                    
//                    Task {
//                        query = await kandinsky.uuid
//                    }
                }
        }
    }
    
    struct NewsCell: View {
        var title: String
        var desc: String?
        
        var body: some View {
            ZStack {
                Rectangle()
                    .cornerRadius(12)
                    .foregroundColor(.gray.opacity(0.2))
                VStack {
                    Text(title).font(.headline)
                    Spacer().frame(height: 12)
                    Text(desc ?? "NOT DESCRIPTION").font(.caption)
                }
                .padding()
            }
        }
    }
}

#Preview {
    More()
}
