//
//  RestaurantsView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 16/01/2021.
//

import SwiftUI


struct RestaurantsView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
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
            
            VStack {
                // Today's offers
                TodaysOffers()
                
                // Free Delivery
                FreeDeliveryView()
                
                // All Offers
                AllOffersView()
            }
            .padding(.bottom, 85)
        }
    }
}


struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}

struct TodaysOffers: View {
    var body: some View {
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
                                HStack {
                                    Text("€40 -50 mins.")
                                    Dot()
                                    Text("€ " + "30.0 for two")
                                    
                                }
                                .font(.poppins(.Medium, size: 12))
                                .lineLimit(1)
                                .minimumScaleFactor(0.6)
                                .foregroundColor(.mainGray)
                            }
                            Spacer(minLength: 5)
                        }
                        .frame(width: 160)
                        .frame(height: 190, alignment: .leading)
                        .cornerRadius(8)
                        .shadow(color: .offWhite, radius: 0.5)
                    }
                }
            }
            .padding(.leading)
        }
    }
}

struct FreeDeliveryView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Free Delivery *")
                    .font(.poppins(.SemiBold, size: 16))
                Spacer()
                
                Button(action: {}, label: {
                    Text("View all")
                        .font(.poppins(.SemiBold, size: 12))
                        .padding(5)
                        .background(Color.mainGray.opacity(0.15))
                        .cornerRadius(5)
                })
                .foregroundColor(.mainGray)
                
            }.padding(.horizontal)
            
            VStack {
                ForEach(0..<2) { _ in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(Food.foods) { food in
                                HStack(alignment: .top){
                                    Image(food.image)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .background(Color.white)
                                        .cornerRadius(5)
                                    VStack(alignment: .leading, spacing: 3){
                                        VStack(alignment: .leading,spacing: 0) {
                                            Text(food.name)
                                                .font(.poppins(.Medium, size: 16))
                                                .lineLimit(1)
                                                .minimumScaleFactor(0.8)
                                            
                                            Text("By " + "Pili Pili")
                                                .font(.poppins(.Medium, size: 11))
                                                .foregroundColor(.mainGray)
                                                .lineLimit(2)
                                        }
                                        
                                        Divider()
                                            .frame(width: 50)
                                        HStack {
                                            HStack(spacing:2) {
                                                Image(systemName: "star.fill")
                                                    .renderingMode(.original)
                                                Text("4.1")
                                            }
                                            Dot()
                                            Text("40-50 mins")
                                            
                                        }
                                        .font(.poppins(.Medium, size: 10))
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.6)
                                        .foregroundColor(.mainGray)
                                        Text("€ " + "14.20")
                                            .font(.poppins(.SemiBold, size: 13))
                                    }
                                }
                                
                                .frame(width: 250, height: 85, alignment: .leading)
                                .padding(8)
                                .background(Color(.systemBackground))
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.mainGray, lineWidth: 0.3))
                                .shadow(color: .offWhite, radius: 0.5)
                                .padding(3)
                            }
                        }
                    }
                }
            }.padding(.leading)
        }
    }
}

struct AllOffersView: View {
    var body: some View {
        HStack {
            VStack(spacing: 10) {
                HStack {
                    Text("All offers")
                        .font(.poppins(.SemiBold, size: 16))
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("View all")
                            .font(.poppins(.SemiBold, size: 12))
                            .padding(5)
                            .background(Color.mainGray.opacity(0.15))
                            .cornerRadius(5)
                    })
                    .foregroundColor(.mainGray)
                    
                }.padding(.horizontal)
                
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(Food.foods) { food in
                                HStack(alignment: .top){
                                    Image(food.image)
                                        .resizable()
                                        .frame(width: 80, height: 80)
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
                                                .padding([.top], 3)
                                                .padding(.leading, -3)
                                            , alignment: .topLeading
                                        )
                                    VStack(alignment: .leading, spacing: 3){
                                        VStack(alignment: .leading,spacing: 0) {
                                            Text(food.name)
                                                .font(.poppins(.Medium, size: 16))
                                                .lineLimit(1)
                                                .minimumScaleFactor(0.8)
                                            
                                            Text("By " + "Pili Pili")
                                                .font(.poppins(.Medium, size: 11))
                                                .foregroundColor(.mainGray)
                                                .lineLimit(2)
                                        }
                                        
                                        Divider()
                                            .frame(width: 50)
                                        HStack {
                                            HStack(spacing:2) {
                                                Image(systemName: "star.fill")
                                                    .renderingMode(.original)
                                                Text("4.1")
                                            }
                                            Dot()
                                            Text("40-50 mins")
                                            
                                        }
                                        .font(.poppins(.Medium, size: 10))
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.6)
                                        .foregroundColor(.mainGray)
                                        Text("€ " + "14.20")
                                            .font(.poppins(.SemiBold, size: 13))
                                    }
                                }
                                
                                .frame(width: 280, height: 85, alignment: .leading)
                                .padding(6)
                                .background(Color(.systemBackground))
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.mainGray, lineWidth: 0.3))
                                .shadow(color: .offWhite, radius: 0.5)
                                .overlay(
                                    Text("HOT DEAL")
                                        .foregroundColor(.white)
                                        .font(.poppins(.Regular, size: 10))
                                        .padding(.horizontal, 4)
                                        .padding(.vertical, 2)
                                        .background(Color.mainColor)
                                        .cornerRadius(3, corners: [.topLeft, .bottomLeft])
                                        .padding([.top], 5
                                        )
                                    , alignment: .topTrailing
                                )
                                .padding(3)
                                
                                
                                
                            }
                        }
                    }
                }.padding(.leading)
            }
        }
    }
}
