//
//  ContentView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: TabItem = TabItem.tabs.first!

    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                if selectedTab.id == 0 {
                    HomeScreen()
                }else {
                    OffersView()
                }
                TabBar(selectedTab: $selectedTab)
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
