//
//  PKSearchViewModel.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 18/2/22.
//

import Foundation
import Firebase
class PKSearchViewModel: ObservableObject {
    @Published var users:[PKUser] = []
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        let list = Firestore.firestore().collection("users")
        list.getDocuments { result, error in
            if let error = error {
                debugPrint("DEBUG: could not fetch users \(error.localizedDescription)")
                return
            }
            
            guard let documents = result?.documents else {
                debugPrint("DEBUG: could not fetch users")
                return
            }
            
            self.users = documents.map({PKUser(dictionary: $0.data())})
                .filter({$0.id != Auth.auth().currentUser?.uid})
        }
    }
}
