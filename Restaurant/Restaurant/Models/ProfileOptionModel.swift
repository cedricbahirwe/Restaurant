//
//  ProfileOptionModel.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 05/02/2021.
//

import Foundation
import SwiftUI

struct ProfileOption: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var image: Image
    
    
    static let options: [ProfileOption] = [
        ProfileOption(title: "My Orders", image: .init(systemName: "list.bullet")),
        ProfileOption(title: "Manage Addresses", image: .init(systemName: "house")),
        ProfileOption(title: "Payments", image: .init(systemName: "creditcard")),
        ProfileOption(title: "Favourites", image: .init(systemName: "suit.heart")),
        ProfileOption(title: "Help", image: .init(systemName: "questionmark.circle")),
        ProfileOption(title: "Logout", image: .init(systemName: "arrow.right.square"))
    ]
}
