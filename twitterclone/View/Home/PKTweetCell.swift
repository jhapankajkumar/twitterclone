//
//  PKTweetCell.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct PKTweetCell: View {
    let tweet: String
    init(tweet: String) {
        self.tweet = tweet
    }
    var body: some View {
        VStack {
            
            HStack(alignment: .top, spacing: 0) {
                Image("batman")
                    .resizable()
                    .frame(width: 56, height: 56, alignment: .center)
                    .clipShape(Circle())
                    .padding([.trailing], 16)
                //Content
                VStack(alignment: .leading, spacing: 0) {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            //Name
                            Text("Pankaj Kumar Jha").font(.system(size: 14, weight: .semibold, design: .default)).lineLimit(1)
                            
                            //Id
                            Text("@appstack21 •").foregroundColor(.gray).font(.system(size: 14, weight: .regular, design: .default)).lineLimit(1)
                            
                            //Date Posted
                            Text("1d").foregroundColor(.gray).font(.system(size: 14, weight: .regular, design: .default))
                            Spacer()
                            Image(systemName: "slider.horizontal.3")
                            
                        }.padding([.bottom], 8).clipped()
                        
                        //Description
                        Text("As the Biden Administration continues to mass release illegal immigrants across the country, House Democrats.").foregroundColor(.black)
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
        PKTweetCell(tweet: "1")
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
