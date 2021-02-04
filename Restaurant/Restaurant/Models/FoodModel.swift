//
//  FoodModel.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 04/02/2021.
//

import Foundation

struct Food: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var subtitle: String
    var description: String?
    var area: String
    var stars: Double
    var price: Double
    
    init(name: String = "", image: String = "", subtitle: String = "",description: String? = "",area: String = "",stars: Double = 4.1,price: Double = 14.20) {
        //        self.id = UUID()
        self.image = image
        self.name = name
        self.subtitle = subtitle
        self.description = description
        self.area = area
        self.stars = stars
        self.price = price
    }
    static let foods = [
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
    
}
