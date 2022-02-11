//
//  PKNewTweetView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 11/2/22.
//

import SwiftUI

struct PKNewTweetView: View {
    @Binding var isPresented: Bool
    @State var tweet: String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top, spacing: 0) {
                    Image("batman").resizable()
                        .frame(width: 56, height: 56, alignment: .center)
                        .scaledToFill()
                        .clipShape(Circle())
                        .padding(.horizontal)

                    PKTextArea(text: $tweet, placeHolder: "Whats Happening!")
                    Spacer()
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        debugPrint(tweet)
                    } label: {
                        Text("Tweet")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

struct PKNewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        PKNewTweetView(isPresented: .constant(false))
    }
}
