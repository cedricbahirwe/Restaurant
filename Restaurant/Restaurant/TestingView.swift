//
//  TestingView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 04/02/2021.
//

import SwiftUI

struct TestingView: View {
    var body: some View {
        List {
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
//                                            showSheet.toggle()
                                        }
                                    }
                            }
                        }
                    }
                }
                .background(Color(.systemBackground))
                .cornerRadius(5)
                .shadow(color: .offWhite, radius: 0.5)
                .onAppear {
                    if index == 3 {
                        
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
