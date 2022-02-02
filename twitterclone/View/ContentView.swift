//
//  ContentView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 31/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeView(title: "Home")
                    .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                
                MessageScreen()
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Messages")
                    }
            }.navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


