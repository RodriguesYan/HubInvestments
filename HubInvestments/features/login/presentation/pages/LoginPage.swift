//
//  LoginPage.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 23/11/24.
//

import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HubSpacer(height: 64)
            Text("Access your account")
                .font(.system(size: 32, weight: .semibold, design: .default))
            HubSpacer(height: 32)
            HubTextField(
                controller: $email,
                placeholder: "Type your e-mail",
                label: "Type your e-mail",
                type: TextFieldType.email
                
            )
            HubSpacer(height: 32)
            HubTextField(
                controller: $password,
                placeholder: "Type your password",
                label: "Password",
                type: TextFieldType.password
            )
            HubSpacer(height: 24)
            Button(action: handleForgetPassword) {
                Text("Forget your password?")
                    .underline()
                    .font(.system(size: 16, weight: .semibold, design: .default))
            }
            .foregroundColor(.black)
            Spacer()
            HubButtonPrimary(text: "Access account") {
                
            }
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
        
    }
    
    func handleForgetPassword() {
        
    }
    
    func signIn() {
        
    }
}

#Preview {
    LoginPage()
}
