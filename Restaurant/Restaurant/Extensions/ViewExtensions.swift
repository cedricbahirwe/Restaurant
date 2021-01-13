//
//  ViewExtensions.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import Foundation
import SwiftUI

extension View {
    
    func whiteBackground() -> some View {
        return ZStack {
            Color.mainBgColor.edgesIgnoringSafeArea(.all)
            self
        }
    }
}
