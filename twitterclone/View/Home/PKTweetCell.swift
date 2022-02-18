//
//  PKTweetCell.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI
import Kingfisher
struct PKTweetCell: View {
    let tweet: PKTweet
    var body: some View {
        VStack {
            
            HStack(alignment: .top, spacing: 0) {
                KFImage(URL(string: tweet.profileImageUrl ?? ""))
                    .resizable()
                    .frame(width: 56, height: 56, alignment: .center)
                    .clipShape(Circle())
                    .padding([.trailing], 16)
                //Content
                VStack(alignment: .leading, spacing: 0) {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            //Name
                            Text(tweet.fullName ?? "").font(.system(size: 14, weight: .semibold, design: .default)).lineLimit(1)
                            
                            //Id
                            Text("@\(tweet.username ?? "")•").foregroundColor(.gray).font(.system(size: 14, weight: .regular, design: .default)).lineLimit(1)
                            
                            //Date Posted
                            Text("1d").foregroundColor(.gray).font(.system(size: 14, weight: .regular, design: .default))
                            Spacer()
                            Image(systemName: "slider.horizontal.3")
                            
                        }.padding([.bottom], 8).clipped()
                        
                        //Description
                        Text(tweet.tweet ?? "").foregroundColor(.black)
                    }.padding([.bottom], 16)
                    //Buttons
                    HStack(alignment: .center, spacing: 0) {
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "message")
                                Text("500")
                            }
                            
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "arrow.2.squarepath")
                                Text("500")
                            }
                            
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "heart").foregroundColor(.gray)
                                Text("500")
                            }
                            
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                            }
                            
                        }
                        Spacer()
                        
                    }.foregroundColor(.gray).font(.footnote)
                    
                }
                
                //Devider
            }.padding()
            Divider().padding([.leading], 8)
        }
    }
}

struct PKTweetCell_Previews: PreviewProvider {
    static var previews: some View {
        PKTweetCell(tweet: PKTweet())
    }
}

struct FixedClipped: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            content.hidden().layoutPriority(1)
            content.fixedSize(horizontal: false, vertical: false)
        }
        .clipped()
    }
}

extension View {
    func fixedClipped() -> some View {
        self.modifier(FixedClipped())
    }
}
