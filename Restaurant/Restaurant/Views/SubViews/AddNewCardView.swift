//
//  AddNewCardView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 04/02/2021.
//

import SwiftUI

struct AddNewCardView: View {
    var body: some View {
        VStack {
            VStack {
                HeaderView(title: "Add New Card")
                    .padding(.bottom)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Card Number")
                    TextField("", text: .constant("945"))
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .strokeBorder(Color.mainGray, lineWidth: 0.5)
                        )
                    
                }
                
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Valid upto (MM/YY)")
                        TextField("", text: .constant(""))
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .strokeBorder(Color.mainGray, lineWidth: 0.5)
                            )
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("CVV")
                        TextField("", text: .constant(""))
                            .padding(8)
                            .frame(width: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .strokeBorder(Color.mainGray, lineWidth: 0.5)
                            )
                        
                    }
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Name on card")
                    TextField("", text: .constant(""))
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .strokeBorder(Color.mainGray, lineWidth: 0.5)
                        )
                }
                
                RedButton(title: "PROCEED")
                    .padding(.vertical)
                
            }
            .font(.poppins(.Light, size: 13))

            .padding(.horizontal)
            .background(
                Color.white.cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                    .edgesIgnoringSafeArea(.top)
            )
            
            Spacer()
        }
        .whiteBackground()

    }
}

struct AddNewCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCardView()
    }
}

struct RedButton: View {
    let title: String
    let action: (() -> ())
    let height: CGFloat
    init(title: String, _ height: CGFloat =  38, _ action: @escaping (()-> ()) = { }) {
        self.title = title
        self.action = action
        self.height = height
    }
    var body: some View {
        
        Button(action: action, label: {
            Text(title)
                .font(.poppins(.Medium, size: 14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(Color.mainColor)
                .cornerRadius(3)
        })
    }
}

