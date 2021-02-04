//
//  RestaurantDetails.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 18/01/2021.
//

import SwiftUI

struct RestaurantDetails: View {
    @State private var showSheet = false
    @State private var showCheckout = false
    @Environment(\.presentationMode) var presentaionMode
    var body: some View {
        ZStack {
            VStack {
                Image("header-burger-3")
                    .resizable()
                    .frame(height: size.height/3)
                    .frame(maxWidth: .infinity)
                    .overlay(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color(.darkGray)]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.25))
                    .overlay(
                        HStack{
                            Button(action: {
                                withAnimation {
                                    presentaionMode.wrappedValue.dismiss()
                                    
                                }
                            }, label: {
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.mainGray)
                                    .padding()
                                    .background(Color(.systemBackground).opacity(0.9))
                                    .cornerRadius(5)
                                
                            })
                            Spacer()
                            Button(action: {}, label: {
                                Image("restaurant")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.mainGray)
                                    .padding(12)
                                    .background(Color(.systemBackground).opacity(0.9))
                                    .cornerRadius(5)
                            })
                            
                        }
                        .padding(.horizontal)
                        .offset(y: -20)
                        
                    )
                VStack {
                    HStack {
                        ForEach(1..<5) { index in
                            Circle()
                                .fill(index == 1 ? Color.mainColor : Color.background)
                                .frame(width: 10, height: 10)
                        }
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text("MC Donald's")
                                .foregroundColor(Color(.label))                                .font(.poppins(.SemiBold, size: 18))
                            Image(systemName: "dot.square")
                            Image(systemName: "dot.square")
                            Spacer()
                            Image(systemName: "heart")
                            
                        }.foregroundColor(.mainColor)
                        Text("Kigali, Rwanda")
                            .font(.poppins(.Medium, size: 14))
                            .foregroundColor(.mainGray)
                        Divider().frame(width: 200)
                        
                        HStack(alignment: .top) {
                            Image(systemName: "star.fill")
                                .renderingMode(.original)
                                .padding(.top, 2)
                            VStack(alignment: .leading, spacing: 10) {
                                Text("4.1 Ratings • 500+")
                                Text("45 Minutes (Delivery time)")
                            }
                            .font(.poppins(.Medium, size: 14))
                            
                            .foregroundColor(.mainGray)
                        }
                        Button(action: {
                            withAnimation {
                                showCheckout.toggle()
                            }
                        }, label: {
                            Text("OFFER • 10% OFF ON ALL BEVERAGES")
                                .font(.poppins(.Medium, size: 12))
                                .foregroundColor(.mainColor)
                                .frame(maxWidth: .infinity)
                                .frame(height: 32)
                                .background(Color.mainColor.opacity(0.2))
                                .cornerRadius(5)
                                
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .strokeBorder(Color.mainColor, style: StrokeStyle(lineWidth: 2, lineCap: .butt, lineJoin: .miter, miterLimit: 0.5, dash: [4], dashPhase: 10))
                                )
                        })
                        .padding(.top, 10)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(15)
                    .shadow(color: .lightShadow, radius: 8, x: -8, y: -8)
                    .shadow(color: .darkShadow, radius: 8, x: 8, y: 8)
                    .padding(.horizontal)
                }
                .padding(.top, -size.height/3/5)
                
                
                ZStack(alignment: .bottom) {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ForEach(0..<5) { index in
                                HStack {
                                    Image("header-burger-\(index+1)")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(5)
                                    VStack(alignment: .leading, spacing: 5) {
                                        HStack {
                                            Text("Creamy nachos")
                                                .font(.poppins(.Medium, size: 16))
                                            Spacer()
                                            Image(systemName: "dot.square")
                                                .foregroundColor(.mainColor)
                                            
                                        }
                                        Text("with mexican salad")
                                            .font(.poppins(.Medium, size: 14))
                                            .foregroundColor(.mainGray)
                                        Divider().frame(width: 60)
                                        HStack  {
                                            Text("€ 1\(index*2).20")
                                                .font(.poppins(.Bold))
                                            Spacer()
                                            
                                            if index%2 == 0 {
                                                Text(" -  1  +")
                                                    .font(.poppins(.SemiBold, size: 10))
                                                    .frame(width: 50, height: 20)
                                                    .background(Color.background)
                                                    .cornerRadius(5)
                                                    .foregroundColor(.red)
                                                    .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.mainColor))
                                            } else {
                                                Text("Add")
                                                    .font(.poppins(.Medium, size: 10))
                                                    .frame(width: 50, height: 20)
                                                    .background(Color.mainColor)
                                                    .cornerRadius(5)
                                                    .foregroundColor(.white)
                                                    .onTapGesture {
                                                        withAnimation {
                                                            showSheet.toggle()
                                                        }
                                                    }
                                            }
                                        }
                                    }
                                }
                                .padding(8)
                                .background(Color(.systemBackground))
                                .cornerRadius(5)
                                .shadow(color: .offWhite, radius: 0.5)
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    
                    SheetView(showCard: $showCheckout, height: 0) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("1 Item  |   15.20 ")
                                    .font(.poppins(.SemiBold, size: 18))
                                Text("Extra charges may apply")
                                    .font(.poppins(.Medium))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            
                            Button(action: {}, label: {
                                Text("CHECKOUT")
                                    .font(.poppins(.SemiBold, size: 14))
                                    .foregroundColor(.white)
                                    .frame(width: 140, height: 40)
                                    .background(Color.mainColor)
                                    .cornerRadius(5)
                            })
                        }
                        .padding()
                        .background(Color(.systemBackground).cornerRadius(15, corners: [.topLeft, .topRight]).shadow(color: Color.offWhite, radius: 3)
                                        .edgesIgnoringSafeArea(.bottom)
                        )
                    }
                }
                
            }
            .whiteBackground()
            .edgesIgnoringSafeArea(.top)
            
            
            ZStack {
                if showSheet {
                    Color.black.opacity(0.6).edgesIgnoringSafeArea(.all)
                }
                
                SheetView(showCard: $showSheet, height: 400)  {
                    CustomizeOrderView()
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
        
    }
}

struct RestaurantDetails_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetails()
            .environment(\.colorScheme, .dark)
        
    }
}
