//
//  OffersView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import SwiftUI

struct OffersView: View {
    @State private var selectedHeader: Int = 0
    var body: some View {
        VStack {
            // Header Menu Switch
            HStack(spacing: 0) {
                Button(action: {
                    selectedHeader = 0
                }, label: {
                    Text("RESTAURANTS")
                        .foregroundColor(selectedHeader == 0 ? .white : .mainColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(selectedHeader == 0 ? Color.mainColor : Color(.systemBackground))
                })
                Button(action: {
                    selectedHeader = 1
                }, label: {
                    Text("PROMO")
                        .foregroundColor(selectedHeader == 1 ? .white : .mainColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(selectedHeader == 1 ? Color.mainColor : Color(.systemBackground))
                })
            }
            .font(.poppins(.Medium, size: 14))
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(Color.mainColor, lineWidth: 1)
            )
            .padding(.horizontal, 30)
            
            if selectedHeader ==  0 {
                RestaurantsView()
            } else {
                PromoView()
            }
        }
        .whiteBackground()
    }
}

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView()
    }
}
