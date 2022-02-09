//
//  PKMessageInputView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct PKMessageInputView: View {
    @Binding var message: String
    var body: some View {
        HStack {
            TextField("Message", text: $message)
                .textFieldStyle(.plain)
                .frame(minHeight: 30)
            Button {
                print("Did tap on send button")
            } label: {
                Text("Send").foregroundColor(.blue)
            }
        }.padding(.horizontal)
            .foregroundColor(.gray)
    }
}

struct PKMessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        PKMessageInputView(message: .constant("Hellow World!"))
    }
}
