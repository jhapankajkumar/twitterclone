//
//  PKFloatingButton.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 2/2/22.
//

import SwiftUI

struct PKFloatingButton: View {
    let title: String
    let imageName: String
    let callBack: (() -> Void)?
    let isSystemImage: Bool
    init(title: String, imageName: String, isSystemImage: Bool, callBack: (() -> Void)?) {
        self.imageName = imageName
        self.title = title
        self.callBack = callBack
        self.isSystemImage = isSystemImage
    }
    var body: some View {
        
        Button {
            if let callBack = callBack {
                callBack()
            }
        } label: {
            getImage()
        }
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(Circle())
        .padding()
    }
    
    func getImage() -> some View {
        self.isSystemImage == true ?
             AnyView(Image(systemName: imageName).resizable().scaledToFit().frame(width: 32, height: 32, alignment: .center).padding())
        :
             AnyView(Image(imageName).resizable().renderingMode(.template).frame(width: 32, height: 32, alignment: .center).padding())
        
    }
}

struct PKFloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        PKFloatingButton(title: "Press Me!", imageName: "", isSystemImage: true, callBack: {
            print("Button Tapped")
        })
    }
}
