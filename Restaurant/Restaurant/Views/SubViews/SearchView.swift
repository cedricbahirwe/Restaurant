//
//  SearchView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 01/02/2021.
//

import SwiftUI

struct SearchView: View {
    let foods = ["Creamy nachos", "Tacos", "Belgium waffels", "Italian pizza", "Crispy pasta"]
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 10) {
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 10, height: 10)
                        .foregroundColor(.mainGray)
                        .padding()
                        .frame(width: 40, height: 40)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.offWhite, radius: 3)

                })
                
                HStack {
                    TextField("", text: .constant(""))
                        .padding()
                        
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 40, height: 40)

                    })
                    
                }
                
                .frame(height: 40)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.offWhite, radius: 3)
            }
            
            VStack {
                ForEach(foods, id: \.self) { food in
                    HStack {
                        Text(food)
                            .font(.poppins(.Medium, size: 14))
                        Spacer()
                    }
                    Divider()
                }
            }

            Spacer()
        }
        .padding()
        .whiteBackground()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
