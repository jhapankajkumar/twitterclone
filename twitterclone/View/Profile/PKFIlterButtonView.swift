//
//  PKFIlterButtonView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 9/2/22.
//

import SwiftUI

enum PKTweetFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets:
            return "Tweets"
        case .replies:
        return "Tweets & Replies"
        case .likes:
            return "Likes"
        }
    }
}

struct PKFIlterButtonView: View {
    @Binding var selectionOption: PKTweetFilterOptions
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(PKTweetFilterOptions.allCases.count)
    var padding: CGFloat {
        let rawValue = CGFloat(selectionOption.rawValue)
        let count = CGFloat(PKTweetFilterOptions.allCases.count)
        let padding =  ((UIScreen.main.bounds.width / count) * rawValue) + 16
        debugPrint(padding)
        return padding
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center ,spacing: 0) {
                ForEach(PKTweetFilterOptions.allCases, id:\.self) { option in
                    VStack {
                        Button {
                            self.selectionOption = option
                        } label: {
                            Text(option.title).frame(width: underlineWidth).foregroundColor(.blue )
                        }.background(Color.clear)
                            .padding([.bottom], 4)
                        if selectionOption == option {
                            Rectangle()
                                .frame(width: underlineWidth - 16, height: 3)
                                .foregroundColor(.blue)
                                .animation(.spring(), value: 13)
                                .padding(.leading, 0)
                        }
                    }
                }
            }
        }
    }
}

struct PKFIlterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PKFIlterButtonView(selectionOption: .constant(.tweets))
    }
}
