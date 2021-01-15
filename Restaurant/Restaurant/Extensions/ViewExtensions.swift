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
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct Dot: View {
    var body: some View {
        Text("·").bold().scaleEffect(1.5)
    }
}
