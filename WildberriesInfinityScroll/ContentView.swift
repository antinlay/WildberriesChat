//
//  ContentView.swift
//  WildberriesInfinityScroll
//
//  Created by Janiece Eleonour on 09.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        var gridSize: Double = 100
        var gridItemLayout = Array(repeating: GridItem(.fixed(gridSize), spacing: 30), count: 3)

        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(0...99999, id: \.self) { _ in
                    ComplexLayoutCell(emojiSize: gridSize)
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
