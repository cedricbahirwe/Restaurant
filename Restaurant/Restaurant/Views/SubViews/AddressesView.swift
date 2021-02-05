//
//  AddressesView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 01/02/2021.
//

import SwiftUI

struct AddressesView: View {
    var body: some View {
        VStack {

            HeaderView(title: "Manage Address")
            ScrollView(showsIndicators: false) {
                ForEach(0 ..< 2, id: \.self) { i in
                    VStack(alignment: .leading,spacing: 8) {
                        HStack {
                            Image(systemName: "house")
                                .foregroundColor(.mainGray)
                            Text("Home")
                                .font(.poppins(.SemiBold, size: 14.5))
                        }
                        
                        Group {
                            Text("43-D San Francisco near Church")
                                .foregroundColor(.mainGray)
                            Text("USA")
                                .foregroundColor(.mainGray)
                        }
                        .font(.poppins(.Medium, size: 14))
                        
                        
                        VStack(spacing: 20) {
                        HStack {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("EDIT")
                                    .foregroundColor(.mainColor)
                                    .font(.poppins(.Medium))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 35)
                                    .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.mainColor, lineWidth: 1.5 ))
                            })
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("DELETE")
                                    .foregroundColor(.mainColor)
                                    .font(.poppins(.Medium))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 35)
                                    .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.mainColor, lineWidth: 1.5 ))
                            })
                        }
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("ADD NEW")
                                .foregroundColor(.white)
                                .font(.poppins(.Medium, size: 14))
                                .frame(maxWidth: .infinity)
                                .frame(height: 35)
                                .background(Color.mainColor)
                                .cornerRadius(5)
                        })
                        .padding(.bottom, 8)
                        }
                        
                        Divider()
                    }
                }
            }
            Spacer()
            
        }
        .padding()
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct AddressesView_Previews: PreviewProvider {
    static var previews: some View {
        AddressesView()
    }
}
