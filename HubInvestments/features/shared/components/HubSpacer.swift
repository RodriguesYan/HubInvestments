//
//  Spacer.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 23/11/24.
//

import SwiftUI

struct HubSpacer: View {
    var  height: Double
    
    init(height: Double) {
        self.height = height
    }
    var body: some View {
        Rectangle()
                .frame(height: height) // Acts like a spacer with a fixed height
                .hidden() // Makes the rectangle invisible

    }
}

//#Preview {
//    Spacer()
//}
