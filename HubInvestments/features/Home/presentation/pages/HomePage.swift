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
    @Published var aucAggregation: PositionAggregation?
    
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
    
    func getCategoryName(model: AucAggregationModel) -> String {
        switch model.category {
        case 1: "Stocks"
        case 2: "ETFs"
        case 3: "Funds"
        case 4: "Fixed Income"
        default: ""
        }
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
            ScrollView(showsIndicators: false) {
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
                    Text(HubFormmatter.formatToCurrency(vm.aucAggregation?.totalBalance ?? 0))
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
                HubSpacer(height: 16)
                VStack(alignment: .leading) {
                    Text("Portfolio")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
//                            ForEach(0..<vm.aucAggregation.positionAggregation.count, id: \.self) { position in
//                            PortfolioCardView(//TODO: fazer endpoint retornar o total invested completo
//                                title: "Total invested",
//                                value: 138544.00,
//                                variation: -15213.34,
//                                variationPercentage: 9.89
//                            )
                            if vm.aucAggregation != nil {
                                ForEach(vm.aucAggregation!.positionAggregation, id: \.self) { position in
                                    PortfolioCardView(
                                        title: vm.getCategoryName(model: position),
                                        value: position.currentTotal,
                                        variation: position.pnl,
                                        variationPercentage: position.pnlPercentage
                                    )
                                }
                            }
                           
                        }
                    }
                }
                HubSpacer(height: 16)
                VStack(alignment: .leading) {
                    Text("Products")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(0..<4) { _ in
                                CardView(
                                   text: "Options",
                                   imageName: "dollarsign.arrow.circlepath"
                                )
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                HubSpacer(height: 8)
                MyOrdersCard()
                HubSpacer(height: 8)
                VStack(alignment: .leading) {
                    Text("Offers for you")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(0..<4) { _ in
                                OfferCard(
                                    iconName: "rectangle.portrait.and.arrow.right",
                                    title: "Funds and ETFs recommendation",
                                    subtitle: "Created for your investor profile"
                                )
                                .padding([.trailing], 16)
                            }
                        }
                    }
                }
                Spacer()
            }
            
            
        
         
       
           
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
        .navigationBarBackButtonHidden(true)
        .onAppear {
            Task {
                await vm.getAucAggregation()
            }
        }
    }
}

#Preview {
    HomePage(datasource: HomeDatasource())
}
