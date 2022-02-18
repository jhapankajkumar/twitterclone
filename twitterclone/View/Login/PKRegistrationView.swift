//
//  PKRegistrationView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 11/2/22.
//

import SwiftUI

struct PKRegistrationView: View {
    @State var email: String = ""
    @State var fullName: String = ""
    @State var userName: String = ""
    @State var password: String = ""
    @State var showImagePicker: Bool = false
    @State var selectedImage: UIImage?
    @State var image: Image?
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        image = Image(uiImage: selectedImage)
    }
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        ZStack {
                            if let image = image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .clipShape(Circle())
                            } else {
                                Image("plus_photo")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .sheet(isPresented: $showImagePicker) {
                        loadImage()
                    } content: {
                        PKImagePicker(image: $selectedImage)
                    }
                }
                .padding(.bottom)
                .padding(.top, -80)
                
                
                VStack(spacing: 16) {
                    PKCustomTextField(placeHolder: Text("Full Name"),
                                      leadingImage: "person",
                                      caption: $fullName)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .padding(.horizontal)
                    
                    PKCustomTextField(placeHolder: Text("Email"),
                                      leadingImage: "envelope",
                                      caption: $email)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .padding(.horizontal)
                    
                    
                    
                    PKCustomTextField(placeHolder: Text("Username"),
                                      leadingImage: "person",
                                      caption: $userName)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .padding(.horizontal)
                    
                    PKCustomSecureTextField(placeHolder: Text("Password"),
                                            caption: $password)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .padding(.horizontal)
                    
                }.padding(.bottom)
                
                //Sign In Button
                Button {
                    debugPrint("Sign Up Button Tapped")
                    debugPrint(email)
                    debugPrint(password)
                    //Call login api
                    if let selectedImage = selectedImage {
                        PKAuthViewModel().register(email: email, password: password, fullName: fullName, userName: userName, profilePhoto: selectedImage)
                    }
                    
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                    
                }
                .padding(.horizontal)
                .padding(.horizontal)
                .padding(.vertical, 8)
                
                Spacer()
                Button {
                    debugPrint("Signup Button Tapped")
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an Account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                }
            }
        }.background(Color(red: 25/255, green: 161/255, blue: 242/255).ignoresSafeArea())
    }
}

struct PKRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        PKRegistrationView()
    }
}
