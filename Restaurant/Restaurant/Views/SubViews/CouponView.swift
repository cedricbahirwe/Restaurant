//
//  CouponView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 04/02/2021.
//

import SwiftUI

struct CouponView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 10) {
                HeaderView(title: "Enter discount code")
                VStack(alignment: .leading, spacing: 2) {
                    Text("Enter discount code")
                    TextField("", text: .constant("GET400FF"))
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .strokeBorder(Color.mainGray, lineWidth: 0.5)
                        )
                    
                }
                .font(.poppins(.Light, size: 13))

                RedButton(title: "APPLY NOW!")
            }
            .padding(.horizontal)
            .padding(.bottom)
            .background(Color.white.cornerRadius(15, corners: [.bottomLeft, .bottomRight]).edgesIgnoringSafeArea(.top))
            
            PromoView()
        }
        .whiteBackground()
    }
}

struct CouponView_Previews: PreviewProvider {
    static var previews: some View {
        CouponView()
    }
}
