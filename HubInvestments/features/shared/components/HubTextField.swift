//
//  HubTextField.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 23/11/24.
//

import SwiftUI

struct HubTextField: View {
    @State var controller: String
    @State private var isPasswordVisible: Bool = false
    var label: String
    var placeholder: String
    var isPasswordField: Bool
    
    init(controller: String, label: String = "", placeholder: String = "", isPasswordField: Bool = false) {
        self.controller = controller
        self.label = label
        self.placeholder = placeholder
        self.isPasswordField = isPasswordField
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            ZStack(alignment: .trailing) {
                if isPasswordVisible || !isPasswordField {
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
                } else {
                    SecureField(
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
                if isPasswordField {
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                }
            }
          
        }
    }
}

//#Preview {
//    HubTextField()
//}
