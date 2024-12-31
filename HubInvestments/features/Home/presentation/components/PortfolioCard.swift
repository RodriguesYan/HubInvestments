//
//  CardView.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 26/12/24.
//

import SwiftUI

struct PortfolioCardView: View {
    var title: String
    var value: Double
    var variation: Double
    var variationPercentage: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.body)
                .foregroundColor(.black.opacity(0.7))
            Text(HubFormmatter.formatToCurrency(value))
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            HStack {
                Text(HubFormmatter.formatToCurrency(variation))
                    .font(.subheadline)
                    .foregroundColor(variation < 0 ? .red : .green)
                    .fontWeight(.bold)
                Text("(%\(variationPercentage))")
                    .font(.subheadline)
                    .foregroundColor(variation < 0 ? .red : .green)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: UIScreen.main.bounds.width * 0.8, height: 200)
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
    }
}

//#Preview {
//    CardView()
//}
