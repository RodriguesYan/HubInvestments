//
//  BalanceModel.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 22/12/24.
//

import Foundation

struct AucAggregationModel: Codable {
    let availableBalance: Double
    let fixedIncomeInvested: Double
    let stocksInvested: Double
    let etfsInvested: Double
}
