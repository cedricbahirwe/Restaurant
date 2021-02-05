//
//  SignIn.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import SwiftUI

struct SignIn: View {
    
    @State var isEditingEmail = false
    @State var isEditingPassword = false
    
    @State private var enableLoginButton = true
    @State private var validateEmail: Bool = false
    @State private var validatePassword: Bool = false
    
    
    var body: some View {
        ZStack {
            Color.mainBgColor.edgesIgnoringSafeArea(.all)
            VStack(spacing: 35) {
                
                Text("Sign In")
                    .font(.poppins(.SemiBold, size: 20))
                VStack(alignment: .trailing, spacing: 20) {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 5) {
                            Text("Email Address")
                                .font(.system(size: 15))
                                .foregroundColor(validateEmail ? Color(.label) : Color.gray)
                            if validateEmail {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                            
                        }
                        TextField("eventsbash.com", text: .constant("sample@emailid.com"), onEditingChanged: { editing in
                            if editing {
                                print("Editing Email")
                                
                            } else {
                                print("Not Editing Email")
                            }
                            
                        }, onCommit:  {
                        })
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .foregroundColor(Color(.label))
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 5) {
                            Text("Password")
                                .font(.system(size: 15))
                                .foregroundColor(validatePassword ? Color(.label) : Color.gray)
                            if validatePassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                        
                        TextField("Password", text: .constant(""), onEditingChanged: { editing in
                            if editing {
                                print("Editing Password")
                                
                            } else {
                                print("Not Editing Password")
                            }
                            
                        }, onCommit:  {
                        })
                        .keyboardType(.emailAddress)
                        .textContentType(.password)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .foregroundColor(Color(.label))
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )

                    }
                    
                    Button(action: {}, label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color(.label))
                            .font(.poppins(.Bold, size: 16))
                            
                    })
                    
                }
                
                VStack(spacing: 10) {
                    Button(action: {
                    }) {
                        Text("Sign In")
                            .frame(maxWidth: .infinity)
                            .padding(14)
                            .font(.poppins(.SemiBold, size: 20))
                            .foregroundColor(Color.white)
                            .background(Color.mainColor)
                            .cornerRadius(5)
                    }
//                    .disabled(!(validateEmail && validatePassword))
//                    .opacity(validateEmail && validatePassword ? 1 : 0.5)
                    Text("or").font(.system(size: 20)).foregroundColor(.gray)
                    
                    HStack {
                        Button(action: {
                        }) {
                            HStack {
                                Image("google")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 22, height: 23)
                                Text("Google")
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.gray)
                                    
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray, lineWidth: 1 ))
                            .cornerRadius(5)
                            
                        }
                        
                        Button(action: {
                        }) {
                            HStack {
                                Image("facebook")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 24, height: 25)
                                    .foregroundColor(.white)

                                Text("Facebook")
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.white)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(5)
                            
                        }
                        
                        
                    }
                }
                
                HStack(spacing: 3) {
                    Text("Not yet a member,")
                        .font(.poppins(.SemiBold, size: 16))
                        .foregroundColor(.gray)

                    Button(action: {}, label: {
                        Text("Sign Up")
                            .foregroundColor(.mainColor)
                            .font(.poppins(.Bold, size: 16))
                            
                    })
                    
                }
                
            }
            .padding()
        }
        
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
//            .environment(\.colorScheme, .dark)
    }
}
