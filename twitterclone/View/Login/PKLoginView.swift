//
//  PKLoginView.swift
//  TwitterClone
//
//  Created by Pankaj Kumar Jha on 11/2/22.
//

import SwiftUI

struct PKLoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var isRegistrationPresented: Bool = false
    @EnvironmentObject var viewModel: PKAuthViewModel
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // Image
                    Image("twitter-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .padding(.horizontal)
                        .padding(.top, -100)
                        .padding(.bottom, -20)
                        
                    VStack(spacing: 26) {
                        PKCustomTextField(placeHolder: Text("Email"),
                                          leadingImage: "envelope",
                                          caption: $email)
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
                        
                    }
                    
                    //Forgot Password
                    HStack {
                        Spacer()
                        Button {
                            debugPrint("Forgot Password Button Tapped")
                        } label: {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                        }.padding(.horizontal)
                            .padding(.top, 16)
                    }
                    //Sign In Button
                    Button {
                        debugPrint("Sign In Button Tapped")
                        debugPrint(email)
                        debugPrint(password)
                        viewModel.login(email: email, password: password)
                        //Call login api
                    } label: {
                        Text("Sign In")
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
                    NavigationLink(destination: {
                        PKRegistrationView().navigationBarBackButtonHidden(true)
                    }, label: {
                        HStack {
                            Text("Don't have account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    })
                }
            }.background(Color(red: 25/255, green: 161/255, blue: 242/255).ignoresSafeArea())
        }
    }
}

struct PKLoginView_Previews: PreviewProvider {
    static var previews: some View {
        PKLoginView()
    }
}
