//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 31/1/22.
//

import SwiftUI
import Firebase
@main
struct TwitterCloneApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(PKAuthViewModel())
        }
    }
}
