//
//  MyOrdersView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 01/02/2021.
//

import SwiftUI

struct MyOrdersView: View {
    var body: some View {
        VStack {
            // Header View
            HStack(spacing: 30) {
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 10, height: 10)
                        .foregroundColor(.mainGray)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                })
                Text("My Orders's")
                    .font(.poppins(.SemiBold, size: 20))
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.leading)
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(0..<3, id: \.self) { i in
                        OrderRowView()
                    }
                }
            }
            
            Spacer()
        }
        
        //        .whiteBackground()
        .colorScheme(.light)
    }
}

struct MyOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersView()
    }
}

struct OrderRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("McDonald's")
                    .font(.poppins(.Medium, size: 13))
                Spacer()
                Text("€27.20")
                    .font(.poppins(.Medium, size: 12))
                
                
            }
            
            Text("Bodakdev")
                .foregroundColor(.mainGray)
                .font(.poppins(.Medium, size: 11))
            
            
            Color.mainGray.frame(width: 50, height: 1)
            
            Text("McDonald's")
                .font(.poppins(.Medium, size: 13))
            
            
            Text("20 Oct 2021, 05:10 PM")
                .foregroundColor(.mainGray)
                .font(.poppins(.Medium, size: 11))
            
            Button(action: {}, label: {
                Text("REORDER")
                    .foregroundColor(.mainColor)
                    .font(.poppins(.SemiBold, size: 12))
                    .frame(width: 120, height: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.mainColor, lineWidth: 1.5)
                    )
            })
            .padding(.vertical, 8)
            Divider()
        }
        .padding(.horizontal)
    }
}
