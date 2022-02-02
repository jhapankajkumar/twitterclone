//
//  SearchView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct SearchView: View {
    @State var text: String = ""
    var body: some View {
        ScrollView {
            PKSearchBar(text: $text)
                .padding(.top, 20)
            VStack (alignment: .leading, spacing: 0) {
                ForEach(0..<10) { _ in
                    HStack { Spacer() }
                    PKSearchCell()
                }
            }.padding(.leading)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
