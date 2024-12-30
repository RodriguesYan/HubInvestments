//
//  MyOrdersCard.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 26/12/24.
//

import SwiftUI

struct MyOrdersCard: View {
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "square.and.arrow.up")
                .resizable()
                  .frame(width: 24.0, height: 24.0)
            Spacer()
            Text("My orders")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding([.top], 5)
            Spacer()
            Image(systemName: "arrow.forward")
                .resizable()
                  .frame(width: 16.0, height: 16.0)
        }
        .padding([.all], 24)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
    }
}

#Preview {
    MyOrdersCard()
}
