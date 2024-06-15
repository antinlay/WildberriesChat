//
//  SearchView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.06.2024.
//

import SwiftUI

public struct SearchView: ViewModifier {
    @State var searchText = ""
        
    public func body(content: Content) -> some View {
        content
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
//                .padding(.horizontal, 20)
//                .clipShape(RoundedRectangle(cornerRadius: 10))

    }
}

extension View {
    func searchView(_ searchText: String) -> some View {
        modifier(SearchView(searchText: searchText))
    }
}
