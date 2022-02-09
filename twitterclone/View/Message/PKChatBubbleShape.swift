//
//  PKChatBubbleShape.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct PKChatBubbleShape: Shape {
    var isFromCurrentUser: Bool = false
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

struct PKChatBubbleShape_Previews: PreviewProvider {
    static var previews: some View {
        PKChatBubbleShape(isFromCurrentUser: false)
    }
}
