//
//  PKAuthUser.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 17/2/22.
//

import Foundation
import SwiftUI
import Firebase
class PKAuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    @Published var error: Error?
    @Published var user: PKUser?
    @Published var isAuthenticating: Bool = false
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            if let error = error {
                debugPrint("DEBUG: Failed to login \(error.localizedDescription)")
                return
            }
            
            debugPrint("DEBUG: Login Success \(authResult?.user.uid)")
            self?.userSession = authResult?.user
        }
    }
    
    
    func register(email: String, password: String, fullName: String, userName: String, profilePhoto: UIImage) {
        
        guard let imageData = profilePhoto.jpegData(compressionQuality: 0.3) else {
            return
        }
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { result, error in
            if let error = error {
                debugPrint("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            debugPrint("DEBUG: Photo uploaded successfully")
            
            storageRef.downloadURL { url, _
                in
                guard let profileImageUrl = url?.absoluteString else {return}
                
                Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
                    if let error = error {
                        debugPrint("DEBUG: Error \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = authResult?.user else {return}
                    
                    
                    let data = [
                        "email": email,
                        "username": userName,
                        "fullname" : fullName,
                        "profileImageurl": profileImageUrl,
                        "uid": user.uid
                    ]
                    
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        debugPrint("DEBUG: Successfully uploaded user data")
                    }
                    
                }
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }

    func fetchUser() {
        guard let uid = userSession?.uid else {return}
        Firestore.firestore().collection("users").document(uid).getDocument { doc, error in
            if let error = error {
                debugPrint("DEBUG: could not fetch user detail \(error.localizedDescription)")
                return
            }
            
            if let userData = doc?.data() {
                let user: PKUser = PKUser.init(dictionary: userData)
                self.user = user
            }
        }
    }
}
