//
//  PKSearchBar.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct PKSearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding()
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0,
                                   idealWidth: nil,
                                   maxWidth: .infinity,
                                   minHeight: 0,
                                   idealHeight: 0,
                                   maxHeight: .infinity,
                                   alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
        }.padding(.horizontal, 10).foregroundColor(.black)
    }
}

struct PKSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        PKSearchBar(text: .constant("Search..."))
    }
}
