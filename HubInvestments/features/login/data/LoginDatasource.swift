//
//  LoginDatasource.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 01/12/24.
//

import Foundation
import SwiftUI
import Combine

struct LoginModel: Codable {
    let token: String
}

protocol LoginDatasourceProtocol {
    func getData(email: String, password: String) -> AnyPublisher<LoginModel, Error>
}

//class LoginDatasourceMock: LoginDatasourceProtocol {
//    let testData: LoginModel = LoginModel(token: "fdjsjaiojfijsio")
//    
//    //A way to mock AnyPublisher responses
//    func getData() -> AnyPublisher<LoginModel, Error> {
//        Just(testData)
//            .tryMap({ $0})
//            .eraseToAnyPublisher()
//    }
//}

class LoginDatasource: LoginDatasourceProtocol {
//    let url: URL = URL(string: "http://localhost:8080/login")!//TODO: fazer tratamento desse nullable
    let url: URL = URL(string: "http://192.168.0.172:8080/login")!//TODO: fazer tratamento desse nullable
    //192.168.0.42
    
    func getData(email: String, password: String) -> AnyPublisher<LoginModel, Error> {
        var request = URLRequest(url: url)
            request.httpMethod = "POST"
        
        let body: [String: String] = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
      return URLSession
            .shared.dataTaskPublisher(for: request)
            .map({ $0.data })
            .decode(type: LoginModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
