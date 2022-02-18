//
//  PKTweet.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 18/2/22.
//

import Foundation
struct PKTweet: Identifiable, Hashable {
    var id: String?
    var tweet: String?
    var username: String?
    var fullName: String?
    var profileImageUrl: String?
    var email: String?
    var userId: String?
    var date: String?

    init() {}
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.fullName = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageurl"] as? String ?? ""
        self.userId = dictionary["userid"] as? String ?? ""
        self.tweet = dictionary["tweet"] as? String ?? ""
        self.date = dictionary["postDate"] as? String ?? ""
    }
}
