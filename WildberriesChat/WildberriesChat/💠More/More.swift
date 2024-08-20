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
    @State private var modelId = ""
    private var kandinsky = KandinskyImageGeneration()
    
    var body: some View {
        VStack {
            Button {
                Task {
                    modelId = await kandinsky.uuid
                }
            } label: {
                Text("UPDATE")
            }
            
            Text("More \(modelId)")
                .font(.headingFirst)
                .onAppear {
                    
                    Task {
                        await kandinsky.getQuery(promt: "Статуя свободы", style: .anime)
                        modelId = await kandinsky.uuid
                    }
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

enum KandinskyImageSize: CaseIterable {
    case square
    case twoByThree
    case threeByTwo
    case nineBySixteen
    case sixteenByNine

    var width: Int {
        switch self {
        case .square:
            return 1024
        case .twoByThree:
            return 683
        case .threeByTwo:
            return 1024
        case .nineBySixteen:
            return 576
        case .sixteenByNine:
            return 1024
        }
    }

    var height: Int {
        switch self {
        case .square:
            return 1024
        case .twoByThree:
            return 1024
        case .threeByTwo:
            return 683
        case .nineBySixteen:
            return 1024
        case .sixteenByNine:
            return 576
        }
    }

    var aspectRatio: CGFloat {
        return CGFloat(width) / CGFloat(height)
    }
}


enum KandinskyStyle: String, Codable {
    case kandinsky = "KANDINSKY"
    case uhd = "UHD"
    case anime = "ANIME"
    case `default` = "DEFAULT"
}

#Preview {
    More()
}
