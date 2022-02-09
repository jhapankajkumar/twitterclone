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
     
    var body: some View {
        ScrollView {
            PKSearchBar(text: $text)
                .padding(.top, 20)
            VStack (alignment: .leading, spacing: 0) {
                ForEach(0..<10) { _ in
                    HStack { Spacer() }
                    Button {
                        self.show.toggle()
                        self.startChat.toggle()
                    } label: {
                        PKUserCell().foregroundColor(.black)
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
