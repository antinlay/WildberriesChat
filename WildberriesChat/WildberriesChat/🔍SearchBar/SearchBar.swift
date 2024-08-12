//
//  SearchBar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.06.2024.
//

import SwiftUI
import UISystem

struct SearchBar: View {
    @Environment(Search.self) private var search
    
    @FocusState private var searchIsFocused: Bool
    
    private var searchBarIcon: some View {
        Image(.SearchBar.searchIcon)
            .foregroundStyle(.appGray)
    }
    
    private var eraseIcon: some View {
        Image(systemName: "xmark")
            .foregroundStyle(.accent)
    }
        
    var body: some View {
        @Bindable var searchQuery = search

        HStack {
            searchBarIcon
                .padding(.leading)
            TextField("Search", text: $searchQuery.text)
                .modifier(InputTextField())
                .overlay (
                    eraseIcon
                        .opacity(searchQuery.text.isEmpty ? 0.0 : 1.0)
                        .padding(.trailing)
                        .onTapGesture {
                            searchIsFocused = false
                            searchQuery.text = ""
                        }
                    , alignment: .trailing
                )
                .focused($searchIsFocused)
                .autocorrectionDisabled(true)
        }
        .modifier(InputBackground())
    }
}

#Preview {
    SearchBar()
        .environment(Router())
        .environment(Search())
}

