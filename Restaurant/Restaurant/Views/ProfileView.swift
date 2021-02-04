//
//  ProfileView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 15/01/2021.
//

import SwiftUI

struct ProfileOption: Identifiable, Equatable {
//    static func == (lhs: ProfileOption, rhs: ProfileOption) -> Bool {
//        lhs.title == rhs.title
//    }
    
    var id = UUID()
    var title: String
    var image: Image
    
}
struct ProfileView: View {
    private let options: [ProfileOption] = [
        .init(title: "My Orders", image: .init(systemName: "list.bullet")),
        .init(title: "Manage Addresses", image: .init(systemName: "house")),
        .init(title: "Payments", image: .init(systemName: "creditcard")),
        .init(title: "Favourites", image: .init(systemName: "suit.heart")),
        .init(title: "Help", image: .init(systemName: "questionmark.circle")),
        .init(title: "Logout", image: .init(systemName: "arrow.right.square"))
    ]
    
    @State private var goToOrders = false
    @State private var goToManageAdress = false
    @State private var goToFavouritess = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            // Top Header
            VStack(alignment: .leading) {
                HStack {
                    Text("Cédric Bahirwe")
                        .font(.poppins(.SemiBold, size: 23))
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("EDIT")
                            .foregroundColor(.mainColor)
                            .font(.poppins(.Medium))
                    })
                }
                HStack(spacing: 5) {
                    Text("+250 782 628 511")
                    Dot()
                    Text("cedbahirwe@gmail.com")
                    
                }
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .font(.poppins(.Medium, size: 16))
                .foregroundColor(.mainGray)
            }.padding(.horizontal, 6)
            
            Group {
                NavigationLink(
                    destination: AddressesView(),
                    isActive: $goToManageAdress) { }
                
                NavigationLink(
                    destination: MyOrdersView(),
                    isActive: $goToOrders) { }
                
            }
            
            // Profile Options
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(options) { option in
                        VStack(alignment: .leading) {
                            HStack(spacing: 16) {
                                option.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 22, height: 22)
                                Text(option.title)
                                    .font(.poppins(.Regular, size: 18))
                                    .foregroundColor(.black)
                                    .opacity(0.8)
                            }
                            if options.last!.id != option.id {
                                Divider()
                            }

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 4)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if option == options[0] {
                                goToOrders.toggle()
                            } else if option == options[1] {
                                goToManageAdress.toggle()
                            }
                        }

                    }
                    
                }
                .foregroundColor(.mainGray)
                .padding()
            }
            Spacer()
        }
        .padding(10)
        .whiteBackground()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
