//
//  PKUser.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 18/2/22.
//

import Foundation
import UIKit
import Firebase
struct PKUser: Identifiable, Hashable {
    var id: String?
    var fullName: String?
    var profileImageUrl: String?
    var username: String?
    var email: String?
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == self.id
    }
    init() {}
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.fullName = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageurl"] as? String ?? ""
    }
}

