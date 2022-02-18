//
//  PKNewMessageView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 5/2/22.
//

import SwiftUI

struct PKNewMessageView: View {
    @State var text: String = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    
    @ObservedObject var searchViewModel = PKSearchViewModel()
    
    var body: some View {
        ScrollView {
            PKSearchBar(text: $text)
                .padding(.top, 20)
            VStack (alignment: .leading, spacing: 0) {
                ForEach(searchViewModel.users) { user in
                    HStack { Spacer() }
                    Button {
                        self.show.toggle()
                        self.startChat.toggle()
                    } label: {
                        PKUserCell(user: user).foregroundColor(.black)
                    }
                }
            }
            .padding(.leading)
        }
    }
}

struct PKNewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        PKNewMessageView(show: .constant(true), startChat: .constant(true))
    }
}

