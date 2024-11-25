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
    var placeholder: String
    
    init(controller: String, label: String = "", placeholder: String = "") {
        self.controller = controller
        self.label = label
        self.placeholder = placeholder
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            TextField(
                placeholder,
                text: $controller
                
            )
            .frame(height: 58)
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
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
