//
//  HubButton.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 23/11/24.
//

import SwiftUI

struct EnableDisableModifier: ViewModifier {
    var isEnabled: Bool

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: . infinity)
            .background((isEnabled ? Color.green : Color.gray.opacity(0.3)))
            .foregroundColor(.black.opacity(isEnabled ? 1.0 : 0.3))
            .cornerRadius(26)
            .disabled(!isEnabled)
    }
}

extension View {
    func isEnabled(isEnabled: Bool) -> some View {
        self.modifier(EnableDisableModifier(isEnabled: isEnabled))
    }
}


struct HubButtonPrimary: View {
    var text: String
    var action: () -> Void
    @Binding var isLoading: Bool
    
    var body: some View {
        Button(action: action) {
            if(isLoading) {
                ProgressView()
                    .frame(height: 48)
            } else {
                Text(text)
                    .frame(height: 48)
                    .fontWeight(.bold)
            }
        }
    }
}

//#Preview {
//    HubButtonPrimary()
//}
