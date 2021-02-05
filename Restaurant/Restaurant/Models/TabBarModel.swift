//
//  TabBarModel.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 05/02/2021.
//

import Foundation


struct TabItem: Identifiable {
    var id:Int
    var image: String
    var title: String
    
    static let tabs = [
        TabItem(id: 0, image: "explore", title: "Explore"),
        TabItem(id: 1, image: "food", title: "Offers"),
        TabItem(id: 2, image: "cart", title: "Cart"),
        TabItem(id: 3, image: "profile", title: "Profile")
    ]
    
}
