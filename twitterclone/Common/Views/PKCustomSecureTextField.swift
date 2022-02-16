//
//  PKCustomSecureTextField.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 11/2/22.
//

import SwiftUI

struct PKCustomSecureTextField: View {
    let placeHolder: Text
    @Binding var caption: String
    var body: some View {
        ZStack(alignment: .leading) {
            if caption.isEmpty {
                placeHolder.foregroundColor(Color(.init(white: 1, alpha: 0.85)))
                    .padding(.leading, 40)
            }
            HStack(spacing: 16) {
                Image(systemName: "lock").foregroundColor(.white).frame(width: 20, height: 20, alignment: .center)
                
                SecureField("", text: $caption)
            }
        }
    }
}

struct PkCustomSecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        PKCustomSecureTextField(placeHolder: Text(""), caption: .constant(""))
    }
}
