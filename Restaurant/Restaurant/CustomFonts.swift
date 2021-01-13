//
//  CustomFonts.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import Foundation
import SwiftUI

enum PoppinsFontName: String, CaseIterable {
    case Black = "Poppins-Black"
    case BlackItalic = "Poppins-BlackItalic"
    case Bold = "Poppins-Bold"
    case BoldItalic = "Poppins-BoldItalic"
    case ExtraBold = "Poppins-ExtraBold"
    case ExtraBoldItalic = "Poppins-ExtraBoldItalic"
    case ExtraLight = "Poppins-ExtraLight"
    case ExtraLightItalic = "Poppins-ExtraLightItalic"
    case Italic = "Poppins-Italic"
    case Light = "Poppins-Light"
    case LightItalic = "Poppins-LightItalic"
    case Medium = "Poppins-Medium"
    case MediumItalic = "Poppins-MediumItalic"
    case Regular = "Poppins-Regular"
    case SemiBold = "Poppins-SemiBold"
    case SemiBoldItalic = "Poppins-SemiBoldItalic"
    case Thin = "Poppins-Thin"
    case ThinItalic = "Poppins-ThinItalic"
}

extension Font {
    // Create a custom font with the given Poppins Font `name` and `size` that scales with
    /// the body text style.
    static func poppins(_ name: PoppinsFontName, size: CGFloat) -> Font {
        return .custom(name.rawValue, size: size)
    }
}
