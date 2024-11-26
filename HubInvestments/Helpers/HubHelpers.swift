//
//  HubHelpers.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 25/11/24.
//

import Foundation

struct HubHelpers {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
