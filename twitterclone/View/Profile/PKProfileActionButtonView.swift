//
//  PKProfileActionButtonView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 9/2/22.
//

import SwiftUI

struct PKProfileActionButtonView: View {
    let isCurrentUser: Bool
    let deviceWidht = UIScreen.main.bounds.width - 32
    var body: some View {
        GeometryReader { geo in
            VStack {
                if isCurrentUser {
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Edit Profile")
                                .frame(width: deviceWidht, height: 40, alignment: .center)
                                .background(Color.blue)
                                .foregroundColor(.white)
                        }
                        .cornerRadius(20)
                        Spacer()
                    }
                    
                } else {
                    HStack(alignment: .center) {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Follow")
                                .frame(maxWidth: .infinity, minHeight:40, maxHeight: 40)
                                .background(Color.blue)
                                .foregroundColor(.white)
                        }
                        .cornerRadius(20)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Message")
                                .frame(maxWidth: .infinity, minHeight:40, maxHeight: 40)
                                .background(Color.purple)
                                .foregroundColor(.white)
                        }
                        .cornerRadius(20)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct PKProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PKProfileActionButtonView(isCurrentUser: false)
    }
}
