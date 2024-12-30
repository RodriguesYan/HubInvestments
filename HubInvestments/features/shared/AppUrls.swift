//
//  AppUrls.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 22/12/24.
//

import Foundation

//TODO: criar flavors
class AppUrl {
    static var baseUrl: String = "http://192.168.0.48:8080"
    static var login: String = "\(baseUrl)/login"
    static var getAucAggregation: String = "\(baseUrl)/getAucAggregationBalance"
}
