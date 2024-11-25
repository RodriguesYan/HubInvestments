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
                controller: email,
                label: "E-mail",
                placeholder: "Type your e-mail"
            )
            HubSpacer(height: 32)
            HubTextField(
                controller: password,
                label: "Password",
                placeholder: "Type your password"
            )
            Spacer()
            HubButtonPrimary(text: "Access account") {
                
            }
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
        
    }
    
    func signIn() {
        
    }
}

#Preview {
    LoginPage()
}
