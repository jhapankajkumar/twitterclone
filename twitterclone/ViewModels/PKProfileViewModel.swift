//
//  PKProfileViewModel.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 18/2/22.
//

import Foundation
import Firebase

class PKProfileViewModel: ObservableObject {
    @Published var isFollowed: Bool = false
    @Published var tweets: [PKTweet] = []
    let user: PKUser
    
    init(user: PKUser) {
        self.user = user
        isThisUserFollowed()
        fetchTweets()
    }
    func isThisUserFollowed() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().collection("followings").document(uid).collection("user-following").getDocuments { result, _ in
            guard let documents = result?.documents else {return }
            let _ = documents.first { document in
                if document.documentID == self.user.id {
                    self.isFollowed = true
                    return true
                } else {
                    return false
                }
            }
        }
    }
    func follow() {
        self.isFollowed = true
        guard let uid = Auth.auth().currentUser?.uid else {return}

        Firestore.firestore().collection("followings").document(uid).collection("user-following").document(user.id ?? "").setData([:]) { _ in
            Firestore.firestore().collection("followers").document(self.user.id ?? "").collection("user-followers").document(uid).setData([:]) { _ in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        self.isFollowed = false
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().collection("followings").document(uid).collection("user-following").document(user.id ?? "").delete { _ in
            Firestore.firestore().collection("followers").document(self.user.id ?? "").collection("user-followers").document(uid).delete { _ in
                self.isFollowed = false
            }
        }
    }
    
    func fetchTweets() {
        Firestore.firestore().collection("tweets").whereField("uid", isEqualTo: user.id ?? "") .getDocuments { result, error in
            guard let documents = result?.documents else {
                debugPrint("DEBUG: could not fetch tweets")
                return
            }
            self.tweets = documents.map({PKTweet(dictionary: $0.data())})
        }
    }
}

