//
//  More.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI
import UISystem
import OpenAPIURLSession

struct More: View {
    let client = Client(
        serverURL: URL(string: "https://newsapi.org/v2")!,
        transport: URLSessionTransport()
    )
    @State private var isError: Bool = false
    @State private var statusCodeText: Int = 0
    @State private var articles: [Components.Schemas.Article] = []
    
    var body: some View {
        VStack {
            switch isError {
            case true:
                Text("\(statusCodeText)")
                    .font(.title)
            case false:
                List {
                    ForEach(articles, id: \.url) { article in
                        NewsCell(title: article.title, desc: article.description)
                    }
                }
            }
        }
        .task {
            await loadArticles()
        }
    }
    
    func loadArticles() async {
        do {
            let query: Operations.everythingGet.Input.Query = .init(q: "Apple",
                                                                    from: "2024-07-15",
                                                                    sortBy: "popularity",
                                                                    language: "en",
                                                                    apiKey: "d05ddcc9be8945b1aa45b380c8869028")
            let input: Operations.everythingGet.Input = .init(query: query)
            let response = try await client.everythingGet(input)
            switch response {
            case .ok(let response):
                if let jsonArticles = try response.body.json.articles {
                    articles = jsonArticles
                }
            case .default(statusCode: let statusCode, _):
                statusCodeText = statusCode
            }
        } catch {
            isError = true
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
