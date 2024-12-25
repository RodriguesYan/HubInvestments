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
    
    var hideValues: Bool = true
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("Investments")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                Spacer()
                Image(systemName: hideValues ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
            HubSpacer(height: 32)
            VStack(alignment: .leading) {
                Text("Available to invest")
                    .font(.system(size: 16, weight: .regular, design: .default))
                Text("$ 982.839,23")
                    .font(.system(size: 32, weight: .bold, design: .default))
                    .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                HubButtonPrimary(
                    text: "Invest", 
                    action: {
                    
                    }, 
                    isLoading: .constant(false)
                )
                .isEnabled(isEnabled: true)
                HubButtonSecondary(
                    text: "Deposit",
                    action: {
                        
                    }
                )
            }
             
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
        .navigationBarBackButtonHidden(true)
        .onAppear {
            Task {
//                        await vm.getAucAggregation()
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

#Preview {
    HomePage(datasource: HomeDatasource())
}
