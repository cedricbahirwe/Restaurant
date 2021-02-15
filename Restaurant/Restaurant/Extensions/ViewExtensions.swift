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


struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct Dot: View {
    var body: some View {
        Text("·").bold().scaleEffect(1.5)
    }
}
