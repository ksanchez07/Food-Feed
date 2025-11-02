//
//  LoginPage.swift
//  FoodFeed
//
//  Created by rover gutierrez on 10/29/25.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct LoginPage: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggingIn: Bool = false
    @State private var errorMessage: String? = nil
    @State private var showContentPage = false
    @State private var showSignUpPage = false
    let db = Firestore.firestore()
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Welcome Back!")
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
            
            //TODO, add any formatting we want to the sign in instead button
            Button {showSignUpPage = true}
                label: {
                    Text("Sign Up instead")
                        .foregroundColor(.blue)
                }
                .fullScreenCover(isPresented: $showSignUpPage) {
                    SignUpPage()
                }

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
        //TODO, ask RJ what this guard does bc i have no idea
        guard canSubmit else {
            errorMessage = "Please enter a valid email and password."
            return
        }
        isLoggingIn = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if let error = error {
                        self.errorMessage = "Invalid email or password"
                        print("Login failed: \(error.localizedDescription)")
                        self.isLoggingIn = false
                        return
                        
                    } else {
                        showContentPage = true
                        isLoggingIn = false
                    }
                }
            }
    
    
}



#Preview {
    LoginPage()
}
