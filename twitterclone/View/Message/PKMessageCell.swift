//
//  PKMessageCell.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct PKMessageCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 12) {
                Image("batman")
                    .resizable()
                    .frame(width: 56, height: 56, alignment: .center)
                    .clipShape(Circle())
                    .padding([.trailing], 16)
                //Content
                VStack(alignment: .leading, spacing: 4) {
                    Text("appstack21").font(.system(size: 14, weight: .semibold))
                    
                    //Name
                    Text("Long very ver long text coming on the way").font(.system(size: 15))
                    
                }
                .padding(.trailing)
                .foregroundColor(.black)
            }
            Divider()
        }
    }
}

struct PKMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        PKMessageCell()
    }
}
