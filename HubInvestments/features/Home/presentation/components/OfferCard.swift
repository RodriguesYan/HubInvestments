//
//  OfferCard.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 26/12/24.
//

import SwiftUI

struct OfferCard: View {
    var iconName: String
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: iconName)//033500
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.black)
                .padding(8)
                .background(.green)
                .clipShape(Circle())
            Spacer()
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(subtitle)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
//        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .padding([.all], 24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: UIScreen.main.bounds.width * 0.8, height: 200)
        .background(Color(hex: 0x033500))
        .cornerRadius(16)
    }
}

#Preview {
    OfferCard(iconName: "rectangle.portrait.and.arrow.right", title: "Mutual funds and ETFs recommendation", subtitle: "Created for your investor profile")
}
