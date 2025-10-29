//
//  LoginPage.swift
//  FoodFeed
//
//  Created by rover gutierrez on 10/29/25.
//

import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggingIn: Bool = false
    @State private var errorMessage: String? = nil
    @State private var showContentPage = false
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Welcome!")
                .font(.largeTitle).bold()
            VStack(spacing: 16) {
                TextField("Email", text:$email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)

            if let errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }

            Button(action: login) {
                HStack {
                    if isLoggingIn {
                        ProgressView()
                            .tint(.white)
                    }
                    Text(isLoggingIn ? "Logging In..." : "Log In")
                        .bold()
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!canSubmit || isLoggingIn)
            .padding(.horizontal)

            Spacer()
        }
        .fullScreenCover(isPresented: $showContentPage) {
            ContentView()
        }
        .padding(.top, 40)
    }
    
    private var canSubmit: Bool {
        !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !password.isEmpty &&
        email.contains("@")
    }
    
    private func login() {
        errorMessage = nil
        guard canSubmit else {
            errorMessage = "Please enter a valid email and password."
            return
        }
        isLoggingIn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isLoggingIn = false
            if password.count < 4 {
                errorMessage = "Incorrect email or password"
            } else {
                showContentPage = true
            }
        }
    }
}


#Preview {
    LoginPage()
}
