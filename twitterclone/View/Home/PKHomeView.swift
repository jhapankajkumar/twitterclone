//
//  PKHomeView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct PKHomeView: View {
    let title: String
    @State var isLabelHidden = true
    @State var isShowingTweetView: Bool = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(0..<10) { (index) in
                        PKTweetCell(tweet: "\(index + 1)")
                    }
                }
            }
            PKFloatingButton(title: "", imageName: "tweet", isSystemImage: false) {
                isShowingTweetView.toggle()
            }.fullScreenCover(isPresented: $isShowingTweetView) {
                print("Dismissed")
            } content: {
                PKLoginView()
                //PKNewTweetView(isPresented: $isShowingTweetView)
            }
            
        }.navigationTitle("Home")
    }
    
    func updateLable(isHidden: Bool) {
//        self.isLabelHidden = isHidden
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        PKHomeView(title: "Welcome Home")
    }
}
