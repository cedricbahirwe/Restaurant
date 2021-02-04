//
//  HeaderView.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 04/02/2021.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    var action: (() -> ())?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack(spacing: 25) {
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
            Text(title)
                .font(.poppins(.SemiBold, size: 20))
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
