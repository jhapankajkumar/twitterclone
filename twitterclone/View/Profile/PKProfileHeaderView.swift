//
//  PKProfileHeaderView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 9/2/22.
//

import SwiftUI

struct PKProfileHeaderView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120, alignment: .center)
                    .clipShape(Circle())
                    .padding(1)
            }.background(Color(.white))
                .clipShape(Circle())
                .shadow(color: .gray, radius: 10, x: 2, y: 2)
            
            Text("Bruce Wyne")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
                .padding(.bottom, 0)
            Text("@batman")
                .padding(.bottom)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("DC Universe - Anti-Hero - Parasite")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            HStack(spacing: 40) {
                VStack {
                    Text("12").fontWeight(.bold)
                        .font(.system(size: 16))
                    Text("Followers")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                
                VStack {
                    Text("134")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                    Text("Following")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            }.padding([.top, .bottom], 8)
            
        }
    }
}

struct PKProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PKProfileHeaderView()
    }
}
