//
//  PKUserCell.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI
import Kingfisher
struct PKUserCell: View {
    let user: PKUser
    init(user: PKUser) {
        self.user = user
        debugPrint("\(user.profileImageUrl ?? "")")
    }
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            KFImage(URL(string: user.profileImageUrl ?? ""))
                .resizable()
                .frame(width: 56, height: 56, alignment: .center)
                .clipShape(Circle())
                .padding([.trailing], 16)
            //Content
            VStack(alignment: .leading, spacing: 0) {
                Text("@\(user.username ?? "")").font(.system(size: 14, weight: .semibold, design: .default)).foregroundColor(.black)
                Spacer()
                //Name
                Text(user.fullName ?? "").font(.system(size: 14, weight: .regular, design: .default))
                
            }
            .padding(.vertical, 8)
        }.padding(.vertical, 10)
    }
}

struct PKSearchCell_Previews: PreviewProvider {
    static var previews: some View {
        PKUserCell(user: PKUser())
    }
}
