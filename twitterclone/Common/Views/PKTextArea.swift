//
//  PKTextArea.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 11/2/22.
//

import SwiftUI

struct PKTextArea: View {
    @Binding var text: String
    let placeHolder: String
    
    init(text: Binding<String>, placeHolder: String) {
        self._text = text
        self.placeHolder = placeHolder
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeHolder).foregroundColor(Color(.placeholderText))
                    .padding(.horizontal,8)
                    .padding(.vertical, 12)
            }
            TextEditor(text: $text).padding(4)
        }.font(.body)
    }
}
