//
//  ValidateEmailModifier.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 25/11/24.
//

import SwiftUI

struct ValidateEmailModifier: ViewModifier {
    var value: String
    var validator: (String) -> Bool

    func body(content: Content) -> some View {
        content
            .border(isValidEmail(value) ? Color.green : Color.red)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

}

extension View {
    func emailValidator(value: String, validator: @escaping (String) -> Bool) -> some View {
        self.modifier(ValidateEmailModifier(value: value, validator: validator))
    }
}

//
//#Preview {
//    ValidateEmailModifier()
//}
