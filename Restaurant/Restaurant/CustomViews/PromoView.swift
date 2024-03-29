//
//  PromoView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 16/01/2021.
//

import SwiftUI

struct PromoView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                
                // Paytm Promotion
                PaytmView()
                
                // Freecharge Promotion
                FreechargeView()
                
                // Google Promotion
                GoogleView()
                
            }
            .padding([.top, .horizontal])
            .padding(.bottom, 85)
        }
    }
}

struct PromoView_Previews: PreviewProvider {
    static var previews: some View {
        PromoView()
    }
}

struct PaytmView: View {
    @State private var showPaytmDescription = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image("paytm")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 30)
                Spacer()
                DashedButton("FREEDELPTM")
            }
            
            Text("Get Unlimited free delivery using paytm")
                .font(.poppins(.SemiBold, size: 14))
            if showPaytmDescription {
                VStack(spacing: 30) {
                    Text("use code FREEDELPTM & get free delivery on al orders above USD 1.99 \n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor eserunt mollit anim id est laborum")
                }
                .font(.poppins(.Medium, size: 12))
                .foregroundColor(.mainGray)
            }
            
            Button(action: {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.1)) {
                    showPaytmDescription .toggle()
                }
            }, label: {
                Text(showPaytmDescription ? "CLOSE" : "EXPAND")
                    .font(.poppins(.Medium, size: 14))
                    .foregroundColor(showPaytmDescription ? Color(.label) : .mainColor)
                Image(systemName: showPaytmDescription ? "chevron.up" : "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .foregroundColor(.mainGray)
            })
            .padding(.bottom, 10)
        }
        .padding(10)
        .background(Color.background)
        .cornerRadius(15)
        .shadow(color: .lightShadow, radius: 8, x: -8, y: -8)
        .shadow(color: .darkShadow, radius: 8, x: 8, y: 8)
    }
}

struct FreechargeView: View {
    @State private var showFreechargeDescription = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image("freecharge")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 50)
                Spacer()
                DashedButton("FIRSTUSER")

            }
            
            Text("Free Delivery for the first time users")
                .font(.poppins(.SemiBold, size: 14))
            if showFreechargeDescription {
                VStack(spacing: 30) {
                    Text("use code FREEDELPTM & get free delivery on al orders above USD 1.99")
                }
                .font(.poppins(.Medium, size: 12))
                .foregroundColor(.mainGray)
            }
            
            Button(action: {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.1)) {
                    showFreechargeDescription.toggle()
                }
            }, label: {
                Text(showFreechargeDescription ? "CLOSE" : "EXPAND")
                    .font(.poppins(.Medium, size: 14))
                    .foregroundColor(showFreechargeDescription ? Color(.label) : .mainColor)
                Image(systemName: showFreechargeDescription ? "chevron.up" : "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .foregroundColor(.mainGray)
            })
            .padding(.bottom, 10)
        }
        .padding(10)
        
        .background(Color.background)
        .cornerRadius(15)
        .shadow(color: .lightShadow, radius: 8, x: -8, y: -8)
        .shadow(color: .darkShadow, radius: 8, x: 8, y: 8)
    }
}

struct GoogleView: View {
    @State private var showgGpayDescription = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image("gpay")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 25)
                Spacer()
                DashedButton("DELIVERY")
            }
            
            Text("Free Delivery for the first time users")
                .font(.poppins(.SemiBold, size: 14))
            if showgGpayDescription {
                VStack(spacing: 30) {
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor eserunt mollit anim id est laborum")
                }
                .font(.poppins(.Medium, size: 12))
                .foregroundColor(.mainGray)
            }
            
            Button(action: {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.1)) {
                    showgGpayDescription.toggle()
                }
            }, label: {
                Text(showgGpayDescription ? "CLOSE" : "EXPAND")
                    .font(.poppins(.Medium, size: 14))
                    .foregroundColor(showgGpayDescription ? Color(.label) : .mainColor)
                Image(systemName: showgGpayDescription ? "chevron.up" : "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .foregroundColor(.mainGray)
            })
            .padding(.bottom, 10)
        }
        .padding(10)
        .background(Color.background)
        .cornerRadius(15)
        .shadow(color: .lightShadow, radius: 8, x: -8, y: -8)
        .shadow(color: .darkShadow, radius: 8, x: 8, y: 8)
    }
}

struct DashedButton: View {
    var title: String
    var action: (() -> ())
    
    init(_ title: String, _ action: @escaping (() -> ()) = { }) {
        self.title = title
        self.action = action
    }
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .foregroundColor(Color(.label))
                .font(.poppins(.Medium, size: 16))
                .padding(.horizontal)
                .padding(.vertical, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(Color.mainColor, style: StrokeStyle(lineWidth: 2, lineCap: .butt, lineJoin: .miter, miterLimit: 0.5, dash: [5], dashPhase: 13))
                )
        })
    }
}
