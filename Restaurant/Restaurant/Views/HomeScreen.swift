//
//  HomeScreen.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import SwiftUI


struct HomeScreen: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack(spacing: 15)  {
                    // Searching Menu
                    HStack {
                        Image(systemName: "location.circle")
                            .frame(width: 40, height: 40)
                            .rotationEffect(.radians(.pi))
                            .background(Color(.systemBackground))
                            .cornerRadius(5)
                            .shadow(color: Color.offWhite, radius: 4)
                        HStack(spacing: 5) {
                            TextField("Search for meals or area", text: .constant(""))
                                .padding(.leading, 10)
                                .font(.poppins(.Regular))
                            Image(systemName: "magnifyingglass")
                                .frame(width: 40, height: 40)
                            
                        }
                        
                        .frame(height: 40)
                        .background(Color(.systemBackground))
                        .cornerRadius(5)
                        .shadow(color: Color.offWhite, radius: 4)
                    }.padding(.horizontal)
                    
                    // Top Categories
                    TopCategoriesView()
                }
                
                // Popular Items
                PopularItemsView()
                
                
                // NearBy Deals
                NearbyDealsView()
                
                Spacer()
                
            }
        }
        .padding(.bottom, 80)
        .whiteBackground()

    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



struct TopCategoriesView: View {
    @State private var goToDetails = false

    var body: some View {
        VStack(spacing: 10) {
            
            HStack {
                Text("Top Categories")
                    .font(.poppins(.Bold, size: 20))
                Spacer()
                NavigationLink(destination: RestaurantDetails(), isActive: $goToDetails) { }

                Button(action: {}, label: {
                    Image("filter")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 14)
                    Text("Filter")
                        .font(.poppins(.Regular, size: 14))
                })
                .foregroundColor(.mainGray)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Food.foods) { food in
                        VStack (spacing: 5){
                            Image(food.image)
                                .resizable()
                                .frame(width: 100, height: 70)
                                .background(Color(.systemBackground))
                                .cornerRadius(5)
                            Text(food.name)
                                .font(.poppins(.SemiBold, size: 14))
                                .lineLimit(1)
                        }
                        .frame(width: 100)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            goToDetails.toggle()
                        }
                    }
                }
            }.padding(.leading)
        }
    }
}

struct NearbyDealsView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Nearby Deals")
                    .font(.poppins(.Bold, size: 20))
                Spacer()
                
                Button(action: {}, label: {
                    Text("View all")
                        .font(.poppins(.SemiBold, size: 12))
                })
                .foregroundColor(.mainGray)
                
            }
            .padding(.horizontal)
            
            VStack {
                ForEach(0..<2) { index in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(index == 0 ? Food.foods : Food.foods.reversed()) { food in
                                VStack(alignment: .leading){
                                    Image(food.image)
                                        .resizable()
                                        .frame(width: 200, height: 120)
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
                                            Text(food.name)
                                                .font(.poppins(.Medium, size: 18))
                                                .lineLimit(1)
                                                .minimumScaleFactor(0.8)
                                            
                                            Text("Mexican Creamy nachos")
                                                .font(.poppins(.Regular, size: 13))
                                                .foregroundColor(.mainGray)
                                                .lineLimit(2)
                                        }
                                        HStack {
                                            Text("€ " + "15.20")
                                                .font(.poppins(.SemiBold, size: 15))
                                                .foregroundColor(.mainGray)
                                            Text("€ " + "14.20")
                                                .font(.poppins(.SemiBold, size: 17))
                                        }
                                    }
                                    Spacer(minLength: 5)
                                }
                                
                                .frame(height: 210, alignment: .leading)
                                .padding(8)
                                .background(Color(.systemBackground))
                                .cornerRadius(8)
                                .shadow(color: .offWhite, radius: 0.5)
                                .padding(2)
                            }
                        }
                    }
                }
            }
            .padding(.leading)
        }
    }
}

struct PopularItemsView: View {
    var body: some View {
        VStack {
            Divider()
            VStack(spacing: 10) {
                HStack {
                    Text("Popular Items")
                        .font(.poppins(.Bold, size: 20))
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("View all")
                            .font(.poppins(.SemiBold, size: 12))
                    })
                    .foregroundColor(.mainGray)
                    
                }.padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Food.foods) { food in
                            HStack(alignment: .top){
                                Image(food.image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .background(Color.white)
                                    .cornerRadius(5)
                                VStack(alignment: .leading, spacing: 5){
                                    VStack(alignment: .leading,spacing: 0) {
                                        Text(food.name)
                                            .font(.poppins(.Medium, size: 16))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.8)
                                        
                                        Text("By " + "Pili Pili")
                                            .font(.poppins(.Medium, size: 12))
                                            .foregroundColor(.mainGray)
                                            .lineLimit(2)
                                    }
                                    
                                    Divider()
                                        .frame(width: 50)
                                    HStack {
                                        Text("€ " + "15.20")
                                            .font(.poppins(.SemiBold, size: 14))
                                            .foregroundColor(.mainGray)
                                        Text("€ " + "14.20")
                                            .font(.poppins(.SemiBold, size: 16))
                                    }
                                }
                            }
                            
                            .frame(width: 280, height: 85, alignment: .leading)
                            .padding(8)
                            .background(Color(.systemBackground))
                            .cornerRadius(8)
                            .shadow(color: .offWhite, radius: 0.5)
                            .padding(3)
                        }
                    }
                }.padding(.leading)
            }
            Divider().padding(.top, 8)
        }
    }
}
