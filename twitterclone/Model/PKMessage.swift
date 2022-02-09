//
//  PKMessage.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import Foundation
struct PKMessage : Identifiable {
    var id: Int
    var imageName: String
    var message: String
    var isCurrentUser: Bool
}



let MOCK_MESSAGES: [PKMessage] = [
    .init(id: 0, imageName: "batman", message: "Hey Dude!", isCurrentUser: true),
    .init(id: 1, imageName: "spiderman", message: "Hi!", isCurrentUser: false),
    .init(id: 2, imageName: "batman", message: "How Are you", isCurrentUser: true),
    .init(id: 3, imageName: "spiderman", message: "I am very good", isCurrentUser: false),
    .init(id: 4, imageName: "spiderman", message: "How about you?", isCurrentUser: false),
    .init(id: 5, imageName: "batman", message: "Same here", isCurrentUser: true),
    .init(id: 6, imageName: "spiderman", message: "Have you watched the new movie \"The New Life\"", isCurrentUser: false),
    .init(id: 7, imageName: "batman", message: "No dude not yet", isCurrentUser: true),
]
