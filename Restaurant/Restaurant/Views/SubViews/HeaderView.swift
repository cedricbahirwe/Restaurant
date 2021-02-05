//
//  HeaderView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 04/02/2021.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    var subtitle: String = ""
    var action: (() -> ())?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                if action != nil {
                    action?()
                } else {
                    presentationMode.wrappedValue.dismiss()
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
                    .foregroundColor(.mainGray)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
            })
            VStack(alignment: .leading, spacing: -3) {
                Text(title)
                    .font(.poppins(.SemiBold, size: !subtitle.isEmpty ? 18 :  20))
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .foregroundColor(.mainGray)
                        .font(.poppins(.Regular, size: 12))
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

