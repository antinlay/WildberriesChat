//
//  SearchBarView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.06.2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @FocusState private var searchIsFocused: Bool
    
    var body: some View {
        HStack {
            Image(.SearchBar.searchIcon)
                .foregroundStyle(.appGray)
                .padding(.leading)
            TextField("Search", text: $searchText)
                .focused($searchIsFocused)
                .font(FontStyles.bodyFirst)
                .foregroundStyle(.appGray)
                .autocorrectionDisabled()
                .overlay (
                    Image(systemName: "xmark")
                        .foregroundStyle(.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .padding(.trailing)
                        .onTapGesture {
                            searchIsFocused = false
                            searchText = ""
                        }
                    , alignment: .trailing
                )
        }
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(.neutralReverse)
                .frame(height: 36)
        )
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}

