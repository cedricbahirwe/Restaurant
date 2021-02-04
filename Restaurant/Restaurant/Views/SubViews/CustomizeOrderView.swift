//
//  CustomizeOrderView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 04/02/2021.
//

import SwiftUI

struct CustomizeOrderView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Customize Creamy nachos")
                        .font(.poppins(.Medium))
                    Text("€ 10.10")
                        .font(.poppins(.Regular))
                        .foregroundColor(.mainGray)
                    
                }
                Spacer()
                
            }
            .padding()
            .background(Color.mainBgColor)
            VStack(alignment: .leading) {
                
                Text("Repeat last used customization?")
                    .font(.poppins(.Regular))
                    .foregroundColor(.mainGray)
                Text("Double Mayonise, Bigger")
                
                HStack(spacing: 10) {
                    Button(action: {}, label: {
                        Text("I'LL CHOOSE")
                            .font(.poppins(.Medium, size: 14))
                            .foregroundColor(.mainColor)
                            .frame(maxWidth: .infinity)
                            .frame(height: 38)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.mainColor, lineWidth: 2)
                            )
                    })
                    RedButton(title: "REPEAT LAST")
                }
                .padding(.vertical)
            }
            .padding()
            Spacer()
        }
        .background(Color(.systemBackground))
        .cornerRadius(15, corners:  [.topLeft, .topRight])

    }
}

struct CustomizeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeOrderView()
            .environment(\.colorScheme, .dark)
    }
}
