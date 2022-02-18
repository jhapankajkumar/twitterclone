//
//  SearchView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct PKSearchView: View {
    @State var text: String = ""
    @ObservedObject var searchViewModel = PKSearchViewModel()
    var body: some View {
        ScrollView {
            PKSearchBar(text: $text)
                .padding(.top, 20)
            VStack(alignment: .leading, spacing: 10) {
                ForEach(searchViewModel.users, id: \.self) { user in // show received results
                    HStack { Spacer() }
                    NavigationLink(destination: PKUserProfileView(viewModel: PKProfileViewModel(user: user)), label: {
                        PKUserCell(user: user).foregroundColor(.black)
                    })
                }
            }.padding(.leading)
        }
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        PKSearchView()
    }
}
