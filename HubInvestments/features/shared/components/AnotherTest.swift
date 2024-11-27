//
//  AnotherTest.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 26/11/24.
//

import SwiftUI
import Combine

private struct ValidationModifier : ViewModifier  {
   let validation : () -> Bool
   func body(content: Content) -> some View {
         content
            .preference(
               key: ValidationPreferenceKey.self,
               value: [validation()]
            )
      }
   }


struct ValidationPreferenceKey : PreferenceKey {
   static var defaultValue: [Bool] = []

   static func reduce(value: inout [Bool], nextValue: () -> [Bool]) {
      value += nextValue()
   }
}

extension TextField   {
   func validate(_ flag : @escaping ()-> Bool) -> some View {
      self
         .modifier(ValidationModifier(validation: flag))
         .frame(height: 58)
         .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
         .border(.secondary)
         .cornerRadius(8)
         .overlay(
             RoundedRectangle(cornerRadius: 8)
                 .stroke(lineWidth: 1.0)
         )
   }
}

extension SecureField   {
   func validate(_ flag : @escaping ()-> Bool) -> some View {
      self
         .modifier(ValidationModifier(validation: flag))
         .frame(height: 58)
         .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
         .border(.secondary)
         .cornerRadius(8)
         .overlay(
             RoundedRectangle(cornerRadius: 8)
                 .stroke(lineWidth: 1.0)
         )
   }
}

struct TextFormView<Content : View> : View {
   @State var validationSeeds : [Bool] = []
   @ViewBuilder var content : (( @escaping () -> Bool)) -> Content
   var body: some View {
         content(validate)
         .onPreferenceChange(ValidationPreferenceKey.self) { value in
            validationSeeds = value
         }
   }

   private func validate() -> Bool {
      for seed in validationSeeds {
         if !seed { return false}
      }
      return true
   }
}




//#Preview {
//    EmailInputView()
//}
