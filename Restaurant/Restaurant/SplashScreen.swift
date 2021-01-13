//
//  SplashScreen.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
            Image("SplashScreen")
                .resizable()
                .edgesIgnoringSafeArea(.all)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
