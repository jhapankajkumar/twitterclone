//
//  PKUserCell.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct PKUserCell: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image("batman")
                .resizable()
                .frame(width: 56, height: 56, alignment: .center)
                .clipShape(Circle())
                .padding([.trailing], 16)
            //Content
            VStack(alignment: .leading, spacing: 0) {
                Text("appstack21").font(.system(size: 14, weight: .semibold, design: .default)).foregroundColor(.black)
                Spacer()
                //Name
                Text("Pankaj Kumar Jha").font(.system(size: 14, weight: .regular, design: .default))
                
            }
            .padding(.vertical, 8)
        }.padding(.vertical, 10)
    }
}

struct PKSearchCell_Previews: PreviewProvider {
    static var previews: some View {
        PKUserCell()
    }
}
