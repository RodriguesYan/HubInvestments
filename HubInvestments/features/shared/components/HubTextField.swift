//
//  HubTextField.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 23/11/24.
//

import SwiftUI

struct HubTextField: View {
    @State var controller: String
    var label: String
    
    init(controller: String, label: String = "") {
        self.controller = controller
        self.label = label
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Acessar sua conta")
            TextField(
                "My text",
                text: $controller
                
            )
            .frame(height: 58)
            .border(.secondary)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1.0)
            )
        }
    }
}

//#Preview {
//    HubTextField()
//}
