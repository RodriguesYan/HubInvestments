//
//  HubTextField.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 23/11/24.
//

import SwiftUI

struct HubTextField: View {
//    @State var controller: String
//    @State private var isPasswordVisible: Bool = false
//    var label: String
//    var placeholder: String
//    var isPasswordField: Bool
//    
//    init(controller: String, label: String = "", placeholder: String = "", isPasswordField: Bool = false) {
//        self.controller = controller
//        self.label = label
//        self.placeholder = placeholder
//        self.isPasswordField = isPasswordField
//    }
    
    @Binding var controller: String
    @State var isPasswordField: Bool = false
    @State var isSecure: Bool = true
    var placeholder: String = ""
    var label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            ZStack(alignment: .trailing) {
                Group{
                    if isSecure && isPasswordField {
                        SecureField(placeholder, text: $controller)
                    } else {
                        TextField(placeholder, text: $controller)
                    }
                }
                .frame(height: 58)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .border(.secondary)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1.0)
                )
                .animation(.easeInOut(duration: 0.2), value: isSecure)
                
                //Add any common modifiers here so they dont have to be repeated for each Field
                if isPasswordField {
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                }
            }//Add any modifiers shared by the Button and the Fields here
        }
    }
}

//#Preview {
//    HubTextField()
//}
