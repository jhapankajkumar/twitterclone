//
//  PKMessageListView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct PKMessageListView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(destination: PKChatView(), isActive: $showChat, label: {}
            ) 
            ScrollView {
                VStack {
                    ForEach(0..<10) { (index) in
                        
                        NavigationLink {
                            PKChatView()
                        } label: {
                            PKMessageCell()
                        }
                    }
                }.padding(.horizontal, 8)
            }
            PKFloatingButton(title: "", imageName: "envelope", isSystemImage: true) {
                isShowingNewMessageView.toggle()
            }.sheet(isPresented: $isShowingNewMessageView) {
                print("Dismissed")
            } content: {
                PKNewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
            }

            
        }.navigationTitle("Message")
    }
}

struct PKMessageListView_Previews: PreviewProvider {
    static var previews: some View {
        PKMessageListView()
    }
}
