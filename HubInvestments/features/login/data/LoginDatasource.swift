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
    func getData() -> AnyPublisher<LoginModel, Error>
}

class LoginDatasourceMock: LoginDatasourceProtocol {
    let testData: LoginModel = LoginModel(token: "fdjsjaiojfijsio")
    
    //A way to mock AnyPublisher responses
    func getData() -> AnyPublisher<LoginModel, Error> {
        Just(testData)
            .tryMap({ $0})
            .eraseToAnyPublisher()
    }
}

class LoginDatasource: LoginDatasourceProtocol {
    let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")!//TODO: fazer tratamento desse nullable
    
    func getData() -> AnyPublisher<LoginModel, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: LoginModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
