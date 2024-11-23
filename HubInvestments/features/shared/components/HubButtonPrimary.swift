//
//  HubButton.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 23/11/24.
//

import SwiftUI

struct HubButtonPrimary: View {
    var text: String
    var action: () -> Void
    
    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button(action: action){
            Text("Acessar conta")
        }
        .frame(width: .infinity, height: 54)
        .frame(maxWidth: . infinity)
        .background(.green)
        .foregroundColor(.black)
        .cornerRadius(26)
    }
}

//#Preview {
//    HubButtonPrimary()
//}
