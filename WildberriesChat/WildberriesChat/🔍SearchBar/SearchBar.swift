//
//  SearchBar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.06.2024.
//

import SwiftUI
import UISystem

struct SearchBar: View {
    @State var searchText: String
    @FocusState private var searchIsFocused: Bool
    
    private var searchBarIcon: some View {
        Image(.SearchBar.searchIcon)
            .foregroundStyle(.appGray)
    }
    
    private var eraseIcon: some View {
        Image(systemName: "xmark")
            .foregroundStyle(.accent)
    }
    
    private var searchLine: some View {
        TextField("Search", text: $searchText)
            .modifier(InputTextField())
    }
    
    var body: some View {
        HStack {
            searchBarIcon
                .padding(.leading)
            searchLine
                .overlay (
                    eraseIcon
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .padding(.trailing)
                        .onTapGesture {
                            searchIsFocused = false
                            searchText = ""
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
    SearchBar(searchText: "")
        .environment(Router())
}

