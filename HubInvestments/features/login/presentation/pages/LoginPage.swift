//
//  LoginPage.swift
//  HubInvestments
//
//  Created by Yan Rodrigues on 23/11/24.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    var datasource: LoginDatasourceProtocol
    
    init(datasource: LoginDatasourceProtocol) {
        self.datasource = datasource
    }
    
    @Published var email: String = ""
    @Published var emailFeedback: String? = nil
    @Published var password: String = ""
    @Published var passwordFeedback: String? = nil
    @Published var isLoading: Bool = false
    @Published var navigateToDetail = false
    
    @Published var token: String = ""
    var cancellables = Set<AnyCancellable>()
    
    func signIn() {
        datasource.getData(email: email, password: password)
            .sink { _ in
                
            } receiveValue: { [weak self] model in
                self?.token = model.token
                print("my token: \(model.token)")
            }
            .store(in: &cancellables)
    }
    
    func enableButton() -> Bool {
        if passwordFeedback == nil {
            return false
        }
        
        if !passwordFeedback!.isEmpty {
            return false
        }
        
        if emailFeedback == nil {
            return false
        }
        
        if !emailFeedback!.isEmpty {
            return false
        }
        
        if isLoading {
            return false
        }
        
        return true
    }
}

struct LoginPage: View {
    @StateObject private var vm: LoginViewModel
    var datasource: LoginDatasourceProtocol = LoginDatasource()
    
    init(datasource: LoginDatasourceProtocol) {
        _vm = StateObject(wrappedValue: LoginViewModel(datasource: datasource))
    }
    
    var body: some View {
        NavigationStack {
        VStack(alignment: .leading) {
            HubSpacer(height: 64)
            Text("Access your account")
                .font(.system(size: 32, weight: .semibold, design: .default))
            HubSpacer(height: 32)
            HubTextField(
                controller: $vm.email,
                placeholder: "Type your e-mail",
                label: "Type your e-mail",
                type: TextFieldType.email,
                validator: { input in
                    let isValidEmail = HubHelpers.isValidEmail(input)
                    
                    if isValidEmail {
                        vm.emailFeedback = ""
                    } else {
                        vm.emailFeedback = "Put a valid email"
                    }
                }
            )
            if vm.emailFeedback != nil {
                Text(vm.emailFeedback!)
                    .foregroundColor(.red)
            }
            HubSpacer(height: 32)
            HubTextField(
                controller: $vm.password,
                placeholder: "Type your password",
                label: "Password",
                type: TextFieldType.password,
                //                feedback: passwordFeedback,
                validator: { input in
                    if input.count > 6 {
                        vm.passwordFeedback = ""
                    } else {
                        vm.passwordFeedback = "Put a valid password"
                    }
                }
            )
            if vm.passwordFeedback != nil {
                Text(vm.passwordFeedback!)
                    .foregroundColor(.red)
            }
            HubSpacer(height: 24)
            Button(action: handleForgetPassword) {
                Text("Forget your password?")
                    .underline()
                    .font(.system(size: 16, weight: .semibold, design: .default))
            }
            .foregroundColor(.black)
            Spacer()
            HubButtonPrimary(
                text: "Access account",
                action: signIn,
                isLoading: $vm.isLoading
            )
            .isEnabled(isEnabled: vm.enableButton())
            .navigationDestination(isPresented: $vm.navigateToDetail) {
                HomePage(token: vm.token)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
    }
        
    }
    
    func handleForgetPassword() {
        
    }
    
    func signIn() {
        
        Task {
            print("Caiu aqui 1")
            vm.isLoading = true
            vm.signIn()
            try? await Task.sleep(nanoseconds: 2_500_000_000)
            vm.navigateToDetail = true
            print("Caiu aqui 2")
            vm.isLoading = false
        }
        
    }
}

#Preview {
    LoginPage(datasource: LoginDatasource())
}
