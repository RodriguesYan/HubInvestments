//
//  CardView.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 26/12/24.
//

import SwiftUI

struct CardView: View {
    var text: String
    var imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                  .frame(width: 24.0, height: 24.0)
            Text(text)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding([.top], 5)
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(width: 155, height: 110, alignment: .leading)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
    }
}

#Preview {
    CardView(text: "Options", imageName: "dollarsign.arrow.circlepath")
}
