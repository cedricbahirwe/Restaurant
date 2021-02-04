//
//  ContentView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import SwiftUI

let size = UIScreen.main.bounds.size

struct ContentView: View {
    @State var selectedTab: TabItem = TabItem.tabs.first!
    @EnvironmentObject var localAuth:LocalAuthentication
    
    
    var body: some View {
        NavigationView {
            Group {
                if !localAuth.hasEvaluated {
                    SignIn()
//                        .onAppear(perform: localAuth.authenticateUser)
                } else {
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                        if selectedTab.id == 0 {
                            HomeScreen()
                        }else if selectedTab.id == 1 {
                            OffersView()
                        } else if selectedTab.id == 2 {
                            CartView()
//                            RestaurantDetails()
                        } else {
                            ProfileView()
                        }
                        TabBar(selectedTab: $selectedTab)
                    }
                }
            }
            .alert(isPresented: $localAuth.authError.error) {
                Alert(title: Text("Sorry!!!"), message: Text(localAuth.authError.message), dismissButton: .default(Text("Continue"), action: {
                    localAuth.hasEvaluated.toggle()
                }))
            }
            
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LocalAuthentication())
    }
}
