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
    
    @ObservedObject var tweetViewModel = PKTweetViewModel()
    @EnvironmentObject var authViewModel: PKAuthViewModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    if tweetViewModel.tweets.count > 0 {
                        ForEach(tweetViewModel.tweets) { (tweet) in
                            PKTweetCell(tweet: tweet)
                        }
                    } else {
                        Text("You dont have any posts yet")
                    }
                    
                }
            }
            PKFloatingButton(title: "", imageName: "tweet", isSystemImage: false) {
//                isShowingTweetView.toggle()
                authViewModel.signOut()
                
            }.fullScreenCover(isPresented: $isShowingTweetView) {
                print("Dismissed")
            } content: {
                PKNewTweetView(isPresented: $isShowingTweetView)
            }
            
        }
        
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
