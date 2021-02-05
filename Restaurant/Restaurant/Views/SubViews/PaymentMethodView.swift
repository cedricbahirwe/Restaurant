//
//  PaymentMethodView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 05/02/2021.
//

import SwiftUI

struct Wallet: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var balance: Double = 0.0
}

struct Bank: Identifiable, Equatable {
    var id = UUID()
    var image: String
    var name: String
}
struct PaymentMethodView: View {
    var body: some View {
        VStack (spacing: 0){
            HeaderView(title: "Payment Options", subtitle: "1 item(s), To pay: €27.27")
                .padding(.horizontal)
                .padding(.bottom, 5)
                .background(Color(.systemBackground).edgesIgnoringSafeArea(.top))
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    // Wallets View
                    WalletsView()
                    
                    
                    // Cards View
                    VStack(alignment: .leading) {
                        Text("Credit/Debit Cards")
                            .font(.poppins(.SemiBold, size: 20))
                        HStack {
                            Button(action: {}, label: {
                                Text("ADD NEW CARD")
                                    .foregroundColor(Color(.label))
                                    .font(.poppins(.Light, size: 14))
                            })
                            Spacer()
                            Image("visa-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 28)
                                .contrast(0.1)
                            Image("mastercard-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 30)
                                .contrast(0.2)
                            
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(15)
                    
                    // Net banking
                    NetBankingView()
                    
                    // Pay on Delivery
                    PayOnDeliveryView()
                    
                }
                .padding(.bottom)
            }
        }
        .whiteBackground()
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct PaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodView()
        //            .environment(\.colorScheme, .dark)
        
    }
}

struct WalletRowView: View {
    let wallet: Wallet
    var body: some View {
        HStack {
            Image(wallet.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(5)
                .frame(width: 35, height: 35)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.mainGray, lineWidth: 0.5)
                )
            Text(wallet.name)
                .font(.poppins(.Light, size: 14))
            Spacer()
            
            Text("LINK ACCOUNT")
                .font(.poppins(.Light, size: 12))
            
        }
        .padding(.vertical, 5)
    }
}

struct WalletsView: View {
    @State private var wallets: [Wallet] = [
        Wallet(image: "amazonpay", name: "Amazon Pay"),
        Wallet(image: "paytm", name: "Paytm"),
        Wallet(image: "paypalp", name: "PayPal Pay"),
        Wallet(image: "google", name: "Google Pay"),
    ]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Wallets")
                .font(.poppins(.SemiBold, size: 20))
            VStack {
                ForEach(wallets) { wallet in
                    WalletRowView(wallet: wallet)
                }
            }
            
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
    }
}

struct NetBankingView: View {
    @State private var banks: [Bank] = [
        Bank(image: "sc", name: "SC"),
        Bank(image: "diamond", name: "ABC"),
        Bank(image: "equity", name: "Equity"),
        Bank(image: "cimb", name: "CIMB"),
        Bank(image: "hsbc", name: "HSBC"),
    ]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Net Banking")
                .font(.poppins(.SemiBold, size: 20))
            HStack(spacing: 20) {
                ForEach(banks) { bank in
                    VStack(spacing: 5) {
                        Image(bank.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(5)
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .cornerRadius(3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.mainGray, lineWidth: 0.5)
                            )
                        Text(bank.name)
                            .font(.poppins(.Light, size: 13))
                    }
                }
                
            }
            Divider()
            HStack {
                Button(action: {}, label: {
                    HStack {
                        Text("MORE BANKS")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.vertical, 5)
                    .foregroundColor(Color(.label))
                    .font(.poppins(.Light, size: 13))
                    
                })
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
    }
}

struct PayOnDeliveryView: View {
    @State private var cashOnly = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Pay on Delivery")
                .font(.poppins(.SemiBold, size: 20))
            HStack {
                Button(action: {}, label: {
                    Text("Cash ONLY")
                        .foregroundColor(Color(.label))
                        .font(.poppins(.Light, size: 14))
                })
                Spacer()
                Image(systemName: cashOnly ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor( cashOnly ? .green : .mainColor)
                    .onTapGesture {
                        withAnimation {
                            cashOnly.toggle()
                        }
                    }
                
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
    }
}
