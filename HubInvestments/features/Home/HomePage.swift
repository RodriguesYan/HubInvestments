//
//  HomePage.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 01/12/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    var datasource: HomeDatasource
    var cancellables = Set<AnyCancellable>()
    @Published var aucAggregation: AucAggregationModel?
    
    init(datasource: HomeDatasource) {
        self.datasource = datasource
    }
    
    func getAucAggregation() async {
        await datasource.getBalance()
            .sink { _ in
                
            } receiveValue: { model in
                self.aucAggregation = model
            }
            .store(in: &cancellables)
    
    }
}



struct HomePage: View {
    @StateObject private var vm: HomeViewModel
    var datasource: HomeDatasource = HomeDatasource()//TODO: fazer injeçao de dependencia nisso
    
    init(datasource: HomeDatasource) {
        _vm = StateObject(wrappedValue: HomeViewModel(datasource: datasource))
    }
    
    @State var token: String = ""
    
    var body: some View {
        Text(token)
            .onAppear {
                Task {
                    await vm.getAucAggregation()
                }
            }
        
        if vm.aucAggregation != nil {
            VStack {
                Text("Saldo: \(vm.aucAggregation?.availableBalance ?? -1)")
                Text("Stocks: \(vm.aucAggregation?.stocksInvested ?? -1)")
                Text("Etfs: \(vm.aucAggregation?.etfsInvested ?? -1)")
                Text("Renda fixa: \(vm.aucAggregation?.fixedIncomeInvested ?? -1)")
            }
        }
    }
}

//#Preview {
//    HomePage()
//}
