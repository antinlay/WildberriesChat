//
//  ContentView.swift
//  WildberriesInfinityScroll
//
//  Created by Janiece Eleonour on 09.07.2024.
//

import SwiftUI

struct ContentView: View {
    private var gridItemLayout = Array(repeating: GridItem(.fixed(100), spacing: 30), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(0...99999, id: \.self) { emoji in
                        ComplexLayoutCell()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
