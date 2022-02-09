//
//  PKChatView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct PKChatView: View {
    @State var message: String = ""
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES) {(message) in
                        PKMessageViewBubble(message: message)
                    }
                }
            }.padding(.horizontal)
            PKMessageInputView(message: $message).padding()
        }
    }
}

struct PKChatView_Previews: PreviewProvider {
    static var previews: some View {
        PKChatView()
    }
}


