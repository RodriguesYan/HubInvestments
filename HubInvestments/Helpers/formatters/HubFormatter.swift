//
//  HubFormatter.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 26/12/24.
//

import Foundation

struct HubFormmatter {
    static func formatToCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        let formattedTipAmount = formatter.string(from: value as NSNumber) ?? ""
        
        return formattedTipAmount
    }
}
