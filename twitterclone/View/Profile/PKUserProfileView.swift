//
//  PKUserProfile.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 9/2/22.
//

import SwiftUI

struct PKUserProfileView: View {
    @State var selectedOption: PKTweetFilterOptions = .tweets
    @ObservedObject var viewModel: PKProfileViewModel
    init(viewModel: PKProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack {
                PKProfileHeaderView(viewModel: viewModel)
                PKProfileActionButtonView(viewModel: viewModel, isFollowed: $viewModel.isFollowed).padding([.bottom], 16)
                PKFIlterButtonView(selectionOption: $selectedOption).padding([.top])
                ForEach(viewModel.tweets) { (tweet) in
                    PKTweetCell(tweet: tweet)
                }
            }
        }.onAppear {
           // viewModel.fetchTweets(userId: viewModel)
        }
    }
}

struct PKUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        PKUserProfileView(viewModel: PKProfileViewModel(user: PKUser()))
    }
}
