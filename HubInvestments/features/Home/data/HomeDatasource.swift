//
//  HomeDatasource.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 22/12/24.
//
    
import Foundation
import Combine

class HomeDatasource {
    func getBalance() async -> AnyPublisher<AucAggregationModel, Error> {
        let url: URL = URL(string: AppUrl.getAucAggregation)!
        
        let token = await AuthHandler.shared.token
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"//TODO: criar um adapter para requisiçoes http
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return URLSession
            .shared.dataTaskPublisher(for: request)
            .map({ $0.data })
            .decode(type: AucAggregationModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
