//
//  ComplexLayoutCell.swift
//  WildberriesInfinityScroll
//
//  Created by Janiece Eleonour on 11.07.2024.
//

import SwiftUI

struct ComplexLayoutCell: View {
    var emojiSize: Double
    private var emojiView: some View {
            Text(Emoji.korean.randomElement()!)
                .font(.system(size: emojiSize))
                .opacity(0.5)
    }
    
    private var dashedRectangle: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .stroke(style: StrokeStyle(lineWidth: 5, dash: [10, 20]))
            .foregroundStyle(.black)
    }
    
    private var complexRectangleView: some View {
        HStack {
            dashedRectangle
            VStack {
                dashedRectangle
                dashedRectangle
            }
        }
        .rotationEffect(Angle(degrees: [90, 180, 270].randomElement()!))
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            emojiView
            complexRectangleView
        }
    }
}

#Preview {
    ComplexLayoutCell(emojiSize: 100)
}
