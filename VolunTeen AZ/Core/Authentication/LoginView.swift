//
//  LoginView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                //image
                Image("Logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                //form fields
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color.accentColor)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.7)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                //sign up button
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 5) {
                        Text("Dont have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                }

            }
        }
    }
}

// Mark: AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 6
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
