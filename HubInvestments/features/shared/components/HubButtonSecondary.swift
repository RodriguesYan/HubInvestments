//
//  HubButton.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 23/11/24.
//

import SwiftUI

//struct EnableDisableModifier: ViewModifier {
//    var isEnabled: Bool
//
//    func body(content: Content) -> some View {
//        content
//            .frame(maxWidth: . infinity)
//            .background((isEnabled ? Color.green : Color.gray.opacity(0.3)))
//            .foregroundColor(.black.opacity(isEnabled ? 1.0 : 0.3))
//            .cornerRadius(26)
//            .disabled(!isEnabled)
//    }
//}
//
//extension View {
//    func isEnabled(isEnabled: Bool) -> some View {
//        self.modifier(EnableDisableModifier(isEnabled: isEnabled))
//    }
//}


struct HubButtonSecondary: View {
    var text: String
    var action: () -> Void
//    @Binding var isLoading: Bool
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .frame(height: 48)
                .foregroundColor(.black)
                .fontWeight(.bold)
            
        }
        .frame(maxWidth: . infinity)
        .background((Color.gray.opacity(0.3)))
        .cornerRadius(26)
    }
}

#Preview {
    HubButtonSecondary(text: "MyText") {
        
    }
}
