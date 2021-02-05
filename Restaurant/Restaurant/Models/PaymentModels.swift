//
//  PaymentModels.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 05/02/2021.
//

import Foundation

struct Wallet: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var balance: Double = 0.0
}

struct Bank: Identifiable, Equatable {
    var id = UUID()
    var image: String
    var name: String
}

struct CreditCard: Identifiable {
    var id = UUID()
    var image: String
    var number: String
    var isDefault: Bool = false
    
}
