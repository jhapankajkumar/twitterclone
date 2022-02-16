//
//  PKCustomTextField.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 11/2/22.
//

import SwiftUI

struct PKCustomTextField: View {
    let placeHolder: Text
    let leadingImage: String
    @Binding var caption: String
    var body: some View {
        ZStack(alignment: .leading) {
            
            if caption.isEmpty {
                placeHolder.foregroundColor(Color(.init(white: 1, alpha: 0.85)))
                    .padding(.leading, 40)
            }
            HStack(spacing: 16) {
                Image(systemName: leadingImage).foregroundColor(.white).frame(width: 20, height: 20, alignment: .center)
                TextField("", text: $caption)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    
//                Spacer()
//                if caption.isEmpty == false {
//                    Button(action: {
//                        caption = ""
//                    }, label: {
//                        Image(systemName: "xmark.circle")
//                            .foregroundColor(.white)
//                            .frame(width: 20, height: 20, alignment: .center)
//                    })
//                }
            }
        }
    }
}

struct PKInputTextField_Previews: PreviewProvider {
    static var previews: some View {
        PKCustomTextField(placeHolder: Text(""), leadingImage: "", caption: .constant("Email"))
    }
}
