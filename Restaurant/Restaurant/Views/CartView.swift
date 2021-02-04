//
//  CartView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 18/01/2021.
//

import SwiftUI

struct CartView: View {
    
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                // Header View
                HStack(spacing: 0) {
                    Image("macdo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 65)
                        .frame(height: 45)
                    VStack(alignment: .leading) {
                        Text("MacDonald's")
                            .font(.poppins(.Medium))
                        Text("BoldyDov's")
                            .font(.poppins(.Medium, size: 12))
                            .foregroundColor(.mainGray)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground).edgesIgnoringSafeArea(.top))
                .overlay(
                    Button(action: {}, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                            .foregroundColor(.mainGray)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            .padding(.leading)
                    }), alignment: .leading
                    
                )
                ScrollView(showsIndicators: true) {
                    VStack {
                        
                        VStack {
                            // Restaurant items view
                            VStack {
                                ForEach(0 ..< 2) { index in
                                    VStack {
                                        HStack(alignment: .top) {
                                            Image(systemName: "dot.square")
                                                .foregroundColor(index > 0 ? .mainColor : .green)
                                                .padding(.top, 1)
                                            VStack(alignment: .leading, spacing: 3){
                                                Text(index > 0 ? "Moharaja mac" : "Creamy nachos")
                                                    .font(.poppins(.Medium, size: 14))
                                                Text("Regular")
                                                    .font(.poppins(.Medium, size: 10))
                                                    .foregroundColor(.mainGray)
                                                HStack(spacing: 5) {
                                                    Text("Customize")
                                                        .font(.poppins(.Medium, size: 12))
                                                    Image(systemName: "chevron.down")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 12, height: 12)
                                                }
                                                .foregroundColor(.mainGray)
                                            }
                                            Spacer()
                                            Text("1")
                                                .foregroundColor(.mainColor)
                                                .font(.poppins(.Light))
                                                .frame(width: 55)
                                                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(Color.mainColor,lineWidth: 1))
                                            Spacer()
                                            Text(index > 0 ? "$11.10" : "€5.20")
                                                .font(.poppins(.Medium, size: 11))
                                        }
                                        Divider()
                                    }
                                    .padding(10)
                                    .frame(height: 70)
                                }
                            }.padding(.top)
                            
                            
                            // Bill Details View
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Bill Details")
                                    .font(.poppins(.Bold, size: 19))
                                    .padding(.bottom, 5)
                                HStack {
                                    Text("Item Total")
                                        .foregroundColor(.mainGray)
                                    Spacer()
                                    Text("€16.30")
                                }
                                HStack {
                                    Text("Restaurant Charges")
                                        .foregroundColor(.mainGray)
                                    Spacer()
                                    Text("€03.00")
                                }
                                HStack {
                                    Text("Delivery Fee")
                                        .foregroundColor(.mainGray)
                                    Spacer()
                                    Text("€01.00")
                                }
                                HStack {
                                    Text("Offer 10% OFF")
                                        .foregroundColor(.mainGray)
                                    Spacer()
                                    Text("-€03.03")
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                                
                                HStack {
                                    Text("To Pay")
                                        .font(.poppins(.SemiBold, size: 14))
                                    Spacer()
                                    Text("€17.27")
                                        .font(.poppins(.SemiBold, size: 14))
                                }
                                Divider()
                                    .padding(.horizontal, 10)
                                HStack {
                                    Text("Any request for the restaurant?")
                                        .foregroundColor(.mainGray)
                                    Spacer()
                                    Image(systemName: "square.and.pencil").imageScale(.large)
                                }
                                
                                HStack {
                                    Button(action: {}, label: {
                                        Text("Enter discount code")
                                            .foregroundColor(.mainGray)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 30)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .strokeBorder(Color.mainGray, style: StrokeStyle(lineWidth: 1, lineCap: .butt, lineJoin: .miter, miterLimit: 0.5, dash: [4], dashPhase: 10))
                                            )
                                    })
                                    Button(action: {}, label: {
                                        Text("APPLY")
                                            .font(.poppins(.Medium, size: 12))
                                            .foregroundColor(.white)
                                            .frame(width: 150, height: 32)
                                            .background(Color.mainGray)
                                            .cornerRadius(5)
                                    })
                                }.padding(.top, 8)
                                
                                
                            }.padding()
                            .font(.poppins(.Medium, size: 11))
                            
                        }
                        .background(Color(.systemBackground).cornerRadius(15, corners: [.bottomLeft, .bottomRight]).edgesIgnoringSafeArea(.top))
                        
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "bag")
                                Text("Deliver to Work")
                                    .font(.poppins(.SemiBold ))
                                Spacer()
                                Button(action: {}, label: {
                                    Text("CHANGE")
                                        .foregroundColor(.mainGray)
                                        .font(.poppins(.Medium, size: 10))
                                })
                                
                            }
                            Text("536 GM, Dev mail, near Chukudu Cross road...")
                                .font(.poppins(.Medium, size: 12))
                                .lineLimit(1)
                                .minimumScaleFactor(0.65)
                                .foregroundColor(.mainGray)
                            RedButton(title: "MAKE PAYMENT", 35) {
                                withAnimation {
                                    showSheet.toggle()
                                }
                            }
                            .padding(.vertical, 8)
                            
                        }
                        .padding()
                        .padding(.bottom, 85)
                        .background(Color(.systemBackground))
                        .cornerRadius(15)
                    }
                    //                    .padding(.bottom, 85)
                }
            }
            .whiteBackground()
            SheetView(showCard: $showSheet.observeKeyboard, height: 340) {
                QuickAccountView()
            }
            
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CartView()
                .environment(\.colorScheme, .dark)
            CartView()
                .environment(\.colorScheme, .light)
        }
    }
}


struct QuickAccountView: View {
    var body: some View {
        VStack(alignment: .leading, spacing:5) {
            Text("Almost there!")
                .font(.poppins(.SemiBold, size: 20))
            Text("Login/ Create Account quickly to place order")
                .foregroundColor(.mainGray)
                .font(.poppins(.Medium, size: 14))
                .lineLimit(1)
                .minimumScaleFactor(0.6)
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
            Button(action: {
            }, label: {
                Text("CONTINUE")
                    .frame(height: 35)
                    .frame(maxWidth: .infinity)
                    .background(Color.mainColor)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .font(.poppins(.Medium, size: 12))
            })
            .padding(.vertical, 8)
            Spacer()
        }
        .padding(.top)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground).onTapGesture {
            withAnimation {
                hideKeyboard()
            }
        })
        .cornerRadius(20)
        .shadow(color: .lightShadow, radius: 8, x: -8, y: -8)
        .shadow(color: .darkShadow, radius: 8, x: 8, y: 8)
    }
}

