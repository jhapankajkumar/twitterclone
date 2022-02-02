//
//  HomeScreen.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct HomeScreen: View {
    let title: String
    var isLabelHidden = true
    init(title: String) {
        self.title = title
    }
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(0..<10) { (index) in
                        PKTweetCell(tweet: "\(index + 1)")
                    }
                }
            }
            
            Button {
                print("Button Tapped")
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            
        }.navigationTitle("Home")
    }
    
    func updateLable(isHidden: Bool) {
//        self.isLabelHidden = isHidden
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(title: "Welcome Home")
    }
}
