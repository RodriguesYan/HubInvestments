//
//  LoginPage.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 23/11/24.
//

import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Acessar sua conta")
                .frame(alignment: .leading)
            Spacer(height: 32)
            HubTextField(controller: email)
            Spacer(height: 32)
            HubTextField(controller: email)
            Spacer(height: 32)
            HubButtonPrimary(text: "Acessar conta") {
                
            }
//            Button(action: signIn) {
//                Text("Acessar conta")
//            }
//            .frame(width: .infinity, height: 54)
//            .frame(maxWidth: . infinity)
//            .background(.green)
//            .foregroundColor(.black)
//            .cornerRadius(26)
            
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
        
    }
    
    func signIn() {
        
    }
}

#Preview {
    LoginPage()
}
