//
//  PKTweetViewModel.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 18/2/22.
//

import Foundation
import SwiftUI
import Firebase
class PKTweetViewModel: ObservableObject {
    @Published var tweets: [PKTweet] = []
 
    
    func fetchTweets() {
        Firestore.firestore().collection("tweets").whereField("uid", isEqualTo:  "") .getDocuments { result, error in
            guard let documents = result?.documents else {
                debugPrint("DEBUG: could not fetch tweets")
                return
            }
            self.tweets = documents.map({PKTweet(dictionary: $0.data())})
        }
    }
    
    func postTweet(tweet: String) {
//        if let user = authModel.user {
//            let currentDate = Date()
//            let formatter = DateFormatter()
//            let dateString = formatter.string(from: currentDate)
//            let data = [
//                "email": user.email,
//                "username": user.username,
//                "fullname" : user.fullName,
//                "profileImageurl": user.profileImageUrl,
//                "tweet": tweet,
//                "userId": user.id,
//                "postDate": dateString
//            ]
//            
//            Firestore.firestore().collection("tweets").document(tweetId).setData(data) { error in
//                debugPrint("DEBUG: Successfully posted tweets")
//            }
//        }
    }
}
