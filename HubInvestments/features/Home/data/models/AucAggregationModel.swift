//
//  BalanceModel.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 22/12/24.
//

import Foundation

struct PositionAggregation: Codable {
    var totalBalance: Double = 0
    var positionAggregation: [AucAggregationModel] = []
}

struct AucAggregationModel: Hashable, Codable {
    let category: Int
    let totalInvested: Double
    let currentTotal: Double
    let pnl: Double
    let pnlPercentage: Double
    let assets: [Assets]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(category)
    }
    
    static func == (lhs: AucAggregationModel, rhs: AucAggregationModel) -> Bool {
         return lhs.category == rhs.category
     }
}

struct Assets: Codable {
    var symbol: String
    var quantity: Double
    var averagePrice: Double
    var currentPrice: Double
}
