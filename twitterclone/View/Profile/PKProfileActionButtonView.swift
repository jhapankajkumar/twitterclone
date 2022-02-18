//
//  PKProfileActionButtonView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 9/2/22.
//

import SwiftUI

struct PKProfileActionButtonView: View {
    let deviceWidht = UIScreen.main.bounds.width - 32
    let viewModel: PKProfileViewModel
    @Binding var isFollowed: Bool
    var body: some View {
        GeometryReader { geo in
            VStack {
                if viewModel.user.isCurrentUser {
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
                            isFollowed ? viewModel.unfollow() : viewModel.follow()
                            debugPrint(viewModel.isFollowed)
                        } label: {
                            Text(isFollowed == true ? "Following" : "Follow")
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
        PKProfileActionButtonView(viewModel: PKProfileViewModel(user: PKUser()), isFollowed: .constant(false))
    }
}
