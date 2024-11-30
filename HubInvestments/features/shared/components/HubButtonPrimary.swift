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
    
    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button(action: action){
            Text("Acessar conta")
                .frame(height: 48)
        }
    }
}

//#Preview {
//    HubButtonPrimary()
//}
