//
//  TabBar.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import SwiftUI

struct TabItem: Identifiable {
    var id:Int
    var image: String
    var title: String
    
    static let tabs = [
        TabItem(id: 0, image: "explore", title: "Explore"),
        TabItem(id: 1, image: "food", title: "Offers"),
        TabItem(id: 2, image: "cart", title: "Orders"),
        TabItem(id: 3, image: "profile", title: "Profile")
    ]
    
}

struct TabBar: View {
    enum  Tab: Int {
        case explore = 0, restaurants, orders, profile
    }
    private let count: Int  = 4
    
    @Binding var selectedTab: TabItem
    @State private var tabs = TabItem.tabs
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            GeometryReader { geo in
            Capsule()
                .fill(Color.white.opacity(0.3))
                .frame(width: (geo.size.width+20)/CGFloat(count), height: 35)
                .transition(.slide)
                .offset(x: CGFloat(selectedTab.id)*geo.size.width/CGFloat(count))
//                .padding(.leading, CGFloat(2 + (selectedTab.id * 2)))
                
                HStack(spacing: 0) {
                    ForEach(tabs) { tab in
                        HStack(spacing: 3) {
                            
                            Image(tab.image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: selectedTab.title == tab.title  ? 22 : 30)
                                .frame(height:selectedTab.title == tab.title  ? 22 : 30)
                            if selectedTab.title == tab.title {
                                Text(tab.title)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                    .transition(.slide)
                                    .minimumScaleFactor(0.6)
                                    .animation(nil)
                            }
                            
                        }
                        .foregroundColor(selectedTab.title == tab.title ? Color.white : Color.black)
                        .padding(.horizontal, 10)
                        .frame(width: (geo.size.width)/CGFloat(count), height: 35)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    }
                }
            }.frame(height: 50).padding(.top, 10)
            .padding(.horizontal, 10)
            
        }
        .frame(height: 80)
        .background(
            Color.mainColor.cornerRadius(25, corners: [.topLeft, .topRight,]).edgesIgnoringSafeArea(.all)
        )
    }

}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(TabItem.tabs.first!))
    }
}
