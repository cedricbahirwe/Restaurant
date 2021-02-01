//
//  PMethodAlert.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 01/02/2021.
//

import SwiftUI

struct PMethodAlert: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 30) {
                HStack {
                    Image("paypal")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                    Spacer()
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .font(.poppins(.Bold))
                        .rotationEffect(.radians(.pi/4))
                        .offset(x: -5,y: -15)
                }
                .padding(.top)
                VStack(alignment: .leading, spacing: 5) {
                Text("Process to link Pay Pal wallet with")
                    .foregroundColor(.mainGray)
                    .multilineTextAlignment(.leading)
                    .font(.poppins(.Light))
                HStack(spacing: 2) {
                    Text("this number:")
                        .foregroundColor(.mainGray)
                        .multilineTextAlignment(.leading)
                        .font(.poppins(.Light))
                    Text("+250 782 628 511")
                        .font(.poppins(.Regular))
                }
                }
                
                Button(action: {}, label: {
                    Text("CONFIRM")
                        .font(.poppins(.Medium, size: 12))
                        .foregroundColor(.white)
                        .frame(width: 120, height: 32)
                        .background(Color.mainColor)
                        .cornerRadius(5)
                })
                .frame(maxWidth: .infinity)
                
            }
            
            .padding(.bottom)
            .padding(.horizontal)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(Color(.systemBackground))
            .cornerRadius(15)
//            .overlay(
//                     , alignment: .topTrailing)
            .padding()
        }
    }
}

struct PMethodAlert_Previews: PreviewProvider {
    static var previews: some View {
        PMethodAlert()
    }
}
