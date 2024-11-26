//
//  HubTextField.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 23/11/24.
//

import SwiftUI
import Combine

struct HubTextField: View {
    @Binding var controller: String
    @State var isSecure: Bool = true
    var placeholder: String = ""
    var label: String
    var type: TextFieldType	= TextFieldType.comum
 
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            ZStack(alignment: .trailing) {
                Group{
                    if isSecure && type == TextFieldType.password {
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
                if type == TextFieldType.password  {
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? "eye.slash" : "eye")
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
