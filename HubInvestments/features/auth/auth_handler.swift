//
//  auth_handler.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 22/12/24.
//

import Foundation

actor AuthHandler {
    static let shared = AuthHandler()
    
    private init() {}
    
    var token: String = ""
    
    func setToken(token: String) {
        self.token = token
    }
    
    func removeToken() {
        self.token = ""
    }
}
