//
//  ContentView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import SwiftUI

struct ContentView: View {
    let fonts = PoppinsFontName.allCases.map({ $0 })
    var body: some View {
        VStack {
//            Text("Root")
//                .font(.custom("", size: 43))
//                .padding()
//
//            Text("Roow")
//                .font(.poppins(.Black, size: 48))
            ScrollView {
                ForEach(0..<fonts.count) { i in
                    Text("Root")
                        .font(.poppins(fonts[i], size: 20))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
