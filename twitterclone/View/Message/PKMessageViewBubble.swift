//
//  PKMessageViewBubble.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 5/2/22.
//

import SwiftUI

struct PKMessageViewBubble: View {
    let message: PKMessage
    var body: some View {
        HStack {
            if message.isCurrentUser {
                Spacer()
                Text(message.message).foregroundColor(.white).padding()
                    .background(Color( .systemBlue))
                    .clipShape(PKChatBubbleShape(isFromCurrentUser:  message.isCurrentUser))
            } else {
                Image(message.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .clipShape(Circle())
                    .padding(.trailing, 8)
                
                Text(message.message).foregroundColor(.black).padding()
                    .background(Color(.systemGray5))
                    .clipShape(PKChatBubbleShape(isFromCurrentUser:message.isCurrentUser))
                Spacer()
            }
        }
    }
}

struct PKMessageViewBubble_Previews: PreviewProvider {
    static var previews: some View {
        PKMessageViewBubble(message: MOCK_MESSAGES[0])
    }
}
