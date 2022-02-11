//
//  PKUserProfile.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 9/2/22.
//

import SwiftUI

struct PKUserProfileView: View {
    @State var selectedOption: PKTweetFilterOptions = .tweets
    var body: some View {
        ScrollView {
            VStack {
                PKProfileHeaderView()
                PKProfileActionButtonView(isCurrentUser: true).padding([.bottom], 16)
                PKFIlterButtonView(selectionOption: $selectedOption).padding([.top])
                ForEach(0..<10) { (index) in
                    PKTweetCell(tweet: "\(index + 1)")
                }
            }
        }
    }
}

struct PKUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        PKUserProfileView()
    }
}
