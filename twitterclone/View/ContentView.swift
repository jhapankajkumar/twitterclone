//
//  ContentView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 31/1/22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: PKAuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    TabView {
                        PKHomeView(title: "Home")
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        
                        PKSearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        
                        PKMessageListView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Messages")
                            }
                    }
                    .navigationTitle("Home")
//                    .navigationBarItems(leading: Button(action: {
//
//                    }, label: {
//                        KFImage(URL(string: viewModel.user?.profileImageUrl ?? ""))
//                            .resizable().scaledToFill().clipShape(Circle())
//                            .frame(width: 32, height: 32, alignment: .center)
//
//                    }))
//                    .navigationBarItems(trailing: Button(action: {
//
//                    }, label: {
//                        Text()
//
//                    }))
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                
                            } label: {
                                KFImage(URL(string: viewModel.user?.profileImageUrl ?? ""))
                                                            .resizable().scaledToFill().clipShape(Circle())
                                                            .frame(width: 32, height: 32, alignment: .center)
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                viewModel.signOut()
                            } label: {
                                Text("Logout")
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                PKLoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


