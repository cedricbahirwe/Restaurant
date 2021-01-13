//
//  HomeScreen.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import SwiftUI


struct Food: Identifiable {
    var id = UUID()
    var image: String = ""
    var name: String = ""
    var subtitle: String = ""
    var description: String? = ""
    var area: String = ""
    var stars: Double = 0.0
    var price: Double = 0.0
    
    init(name: String = "", image: String = "", subtitle: String = "",description: String? = "",area: String = "",stars: Double = 0.0,price: Double = 0.0) {
        //        self.id = UUID()
        self.image = image
        self.name = name
        self.subtitle = subtitle
        self.description = description
        self.area = area
        self.stars = stars
        self.price = price
    }
    
}
struct HomeScreen: View {
    @State var foods = [
        Food(name: "Pizza", image: "pizza"),
        Food(name: "Burgers", image: "burgers"),
        Food(name: "Steak", image: "steak"),
        Food(name: "Pasta", image: "pasta"),
        Food(name: "Strios", image: "steaks"),
        Food(name: "Salad", image: "salad"),
        Food(name: "Fish", image: "fish"),
        Food(name: "Chicken", image: "chicken"),
        Food(name: "Duck", image: "chickens"),
        Food(name: "Hot Burger", image: "burger"),
    ]
    var body: some View {
        VStack {
            VStack(spacing: 15)  {
                // Searching Menu
                HStack {
                    Image(systemName: "location.circle")
                        .frame(width: 40, height: 40)
                        .rotationEffect(.radians(.pi))
                        .background(Color.white)
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
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: Color.offWhite, radius: 4)
                }
                
                // Top Categories
                VStack(spacing: 10) {
                    HStack {
                        Text("Top Categories")
                            .font(.poppins(.SemiBold, size: 16))
                        Spacer()
                        
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
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(foods) { food in
                                VStack (spacing: 5){
                                    Image(food.image)
                                        .resizable()
                                        .frame(width: 100, height: 70)
                                        .background(Color.white)
                                        .cornerRadius(5)
                                    Text(food.name)
                                        .font(.poppins(.SemiBold, size: 14))
                                        .lineLimit(1)
                                        .foregroundColor(.black)
                                }
                                .frame(width: 100)
                            }
                        }
                    }
                }
            }.padding([.horizontal, .top])
            
            
            // Popular Items
            VStack {
                Divider()
                VStack(spacing: 10) {
                    HStack {
                        Text("Popular Items")
                            .font(.poppins(.SemiBold, size: 16))
                        Spacer()
                        
                        Button(action: {}, label: {
                            Text("View all")
                                .font(.poppins(.SemiBold, size: 12))
                        })
                        .foregroundColor(.mainGray)
                        
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(foods) { food in
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
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                                
                                .frame(width: 280, height: 85, alignment: .leading)
                                .padding(8)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: .offWhite, radius: 04)
                            }
                        }
                    }
                }.padding(.horizontal)
                Divider().padding(.top, 8)
            }
            
            
            // NearBy Deals
            VStack(spacing: 10) {
                HStack {
                    Text("Nearby Deals")
                        .font(.poppins(.SemiBold, size: 16))
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("View all")
                            .font(.poppins(.SemiBold, size: 12))
                    })
                    .foregroundColor(.mainGray)
                    
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(foods) { food in
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
                                            .foregroundColor(.black)
                                    }
                                }
                                Spacer(minLength: 5)
                            }
                            
                            .frame(height: 210, alignment: .leading)
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: .offWhite, radius: 0.5)
                        }
                    }
                }
            }.padding(.horizontal)
            
            
            
            
            Spacer()
            
        }
        .whiteBackground()
        .colorScheme(.light)

    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


