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
    
    
    @State private var showSheet = false
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                // Top Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Cédric Bahirwe")
                            .font(.poppins(.SemiBold, size: 23))
                        Spacer()
                        Button(action: {
                            withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.5)) {
                                showSheet.toggle()
                            }
                        }, label: {
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
            
            SheetView(showCard: $showSheet, height: 300){
                EditAccountView()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct EditAccountView: View {
    var body: some View {
        VStack(alignment: .leading, spacing:5) {
            Text("EDIT ACCOUNT")
                .font(.poppins(.SemiBold, size: 20))
            VStack(alignment: .leading, spacing: 5) {
                Text("Mobile number")
                    .font(.poppins(.Medium, size: 12))
                HStack {
                    HStack(spacing: 2) {
                        Image(systemName: "flag.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 15)
                            .foregroundColor(.mainColor)
                        
                        Text("+243")
                    }
                    .font(.poppins(.Medium, size: 14))
                    .frame(width: 75, height: 40)
                    .overlay(RoundedRectangle(cornerRadius: 3).strokeBorder(Color.mainGray, lineWidth: 1))
                    TextField("000 000 000", text: .constant("000 000 000"))
                        .textContentType(.telephoneNumber)
                        .keyboardType(.phonePad)
                        .padding(.leading)
                        .frame(height: 40)
                        .font(.poppins(.Medium, size: 14))
                        .overlay(RoundedRectangle(cornerRadius: 3).strokeBorder(Color.mainGray, lineWidth: 1))
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Email")
                    .font(.poppins(.Medium, size: 12))
                TextField("example@gmail.com", text: .constant("loremipsum@gmail.com"))
                    .textContentType(.emailAddress)
                    .keyboardType(.phonePad)
                    .padding(.leading)
                    .frame(height: 40)
                    .font(.poppins(.Medium, size: 14))
                    .overlay(RoundedRectangle(cornerRadius: 3).strokeBorder(Color.mainGray, lineWidth: 1))
            }
            
            RedButton(title: "CONTINUE")
                .padding(.vertical, 8)
            Spacer(minLength: 0)
        }
        .keyboardAdaptive()
        .padding(.top)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(radius: 20)
    }
}
