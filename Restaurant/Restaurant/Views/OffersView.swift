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
                    withAnimation {
                        selectedHeader = 0
                    }
                }, label: {
                    Text("RESTAURANTS")
                        .foregroundColor(selectedHeader == 0 ? .white : .mainColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(selectedHeader == 0 ? Color.mainColor : Color.white)
                })
                Button(action: {
                    withAnimation {
                        selectedHeader = 1
                    }
                }, label: {
                    Text("PROMO")
                        .foregroundColor(selectedHeader == 1 ? .white : .mainColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(selectedHeader == 1 ? Color.mainColor : Color.white)
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

            // Advertisement Views
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ..< 10) { index in
                        Image("discount\(index)")
                            .resizable()
                            .frame(width: 250, height: 100)
                            .cornerRadius(8)
                    }
                }
            }
            .padding(.leading)
            
            // Today's offers
            VStack {
                VStack(spacing: 10) {
                    HStack {
                        Text("Today's Offers")
                            .font(.poppins(.SemiBold, size: 16))
                        Spacer()
                        
                        Button(action: {}, label: {
                            Text("View all")
                                .font(.poppins(.SemiBold, size: 12))
                        })
                        .foregroundColor(.mainGray)
                        .hidden()
                        
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(Food.foods) { food in
                                VStack(alignment: .leading){
                                    Image(food.image)
                                        .resizable()
                                        .frame(width: 160, height: 120)
                                        .background(Color.white)
                                        .cornerRadius(5)
                                        .overlay(
                                            Text("10% OFF")
                                                .foregroundColor(.white)
                                                .font(.poppins(.Regular, size: 12))
                                                .padding(.horizontal, 4)
                                                .padding(.vertical, 2)
                                                .background(Color.mainColor)
                                                .cornerRadius(3)
                                                .padding(3)
                                            , alignment: .topTrailing
                                            )
                                    VStack(alignment: .leading, spacing: 5){
                                        VStack(alignment: .leading, spacing: 0) {
                                            HStack(spacing: 3) {
                                                Text(food.name)
                                                    .font(.poppins(.Medium, size: 18))
                                                    .lineLimit(1)
                                                    .minimumScaleFactor(0.8)
                                                Spacer()
                                                
                                                Image(systemName: "star.fill")
                                                    .renderingMode(.original)
                                                    .imageScale(.small)
                                                Text(food.stars.description)
                                            }
                                            
                                            Text("Mexican Creamy nachos")
                                                .font(.poppins(.Regular, size: 13))
                                                .foregroundColor(.mainGray)
                                                .lineLimit(2)
                                        }
                                        HStack {
                                            Text("€ " + "15.20")
                                                .font(.poppins(.SemiBold, size: 15))
                                                .foregroundColor(.mainGray)
                                            Text("€ " + "\(food.price)")
                                                .font(.poppins(.SemiBold, size: 17))
                                                .foregroundColor(.black)
                                        }
                                    }
                                    Spacer(minLength: 5)
                                }
                                
                                .frame(height: 210, alignment: .leading)
                                .cornerRadius(8)
                                .shadow(color: .offWhite, radius: 0.5)
                            }
                        }
                    }
                    .padding(.leading)
                }
            }
            Spacer()
        }
        
        .whiteBackground()
    }
}

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView()
    }
}
