//
//  ProfileView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 15/01/2021.
//

import SwiftUI


struct ProfileView: View {
    
    
    @State private var goToOrders = false
    @State private var goToManageAdress = false
    @State private var goToPayment = false
    
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
                }
                .padding(.horizontal, 6)
                .padding(10)
                .background(Color(.systemBackground).edgesIgnoringSafeArea(.top))

                Group {
                    NavigationLink(
                        destination: AddressesView(),
                        isActive: $goToManageAdress) { }
                    
                    NavigationLink(
                        destination: MyOrdersView(),
                        isActive: $goToOrders) { }
                    NavigationLink(
                        destination: PaymentMethodView(),
                        isActive: $goToPayment) { }
                    
                }
                
                
                // Profile Options
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ForEach(ProfileOption.options) { option in
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
                                if ProfileOption.options.last!.id != option.id {
                                    Divider()
                                }

                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 4)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if option == ProfileOption.options[0] {
                                    goToOrders.toggle()
                                } else if option == ProfileOption.options[1] {
                                    goToManageAdress.toggle()
                                } else if option == ProfileOption.options[2] {
                                    goToPayment.toggle()
                                }
                            }
                        }
                        
                    }
                    .foregroundColor(.mainGray)
                    .padding()
                }
                .frame(height: 60*CGFloat(ProfileOption.options.count))
                .background(Color(.systemBackground).edgesIgnoringSafeArea(.top))
                .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                Spacer()
            }
            .whiteBackground()
            
            SheetView(showCard: $showSheet.observeKeyboard){
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
                    .keyboardType(.emailAddress)
                    .padding(.leading)
                    .frame(height: 40)
                    .font(.poppins(.Medium, size: 14))
                    .overlay(RoundedRectangle(cornerRadius: 3).strokeBorder(Color.mainGray, lineWidth: 1))
            }
            
            RedButton(title: "CONTINUE")
                .padding(.vertical, 8)
            Spacer(minLength: 0)
        }
        .padding(.top)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground).onTapGesture {
            withAnimation { hideKeyboard() }
        })
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(color: .lightShadow, radius: 8, x: -8, y: -8)
        .shadow(color: .darkShadow, radius: 8, x: 8, y: 8)
    }
}
