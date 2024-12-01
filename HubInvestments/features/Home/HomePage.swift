//
//  HomePage.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 01/12/24.
//

import SwiftUI

struct HomePage: View {
    @State var token: String = ""
    
    var body: some View {
        Text(token)
    }
}

#Preview {
    HomePage()
}
