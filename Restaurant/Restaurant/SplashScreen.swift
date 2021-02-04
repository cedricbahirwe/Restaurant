//
//  SplashScreen.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.mainColor
                .edgesIgnoringSafeArea(.all)

            Image("SplashScreen")
                    .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                Spacer()
                Image("cedric-code")
                    .renderingMode(.template)
                    .foregroundColor(.white)
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
