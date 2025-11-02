//
//  SignUpPage.swift
//  FoodFeed
//
//  Created by Kareem Sanchez on 11/2/25.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct SignUpPage: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSigningUp: Bool = false
    @State private var errorMessage: String? = nil
    @State private var showContentPage = false
    @State private var showLoginPage = false
    let db = Firestore.firestore()
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Welcome!")
                .font(.largeTitle).bold()
            VStack(spacing: 16) {
                //TODO, make first name and last name just 1 block, and split them into 2 in code
                TextField("First Name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(.roundedBorder)
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

            
            Button(action: signUp) {
                HStack {
                    if isSigningUp {
                        ProgressView()
                            .tint(.white)
                    }
                    Text(isSigningUp ? "Signing up..." : "Sign up")
                        .bold()
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!canSubmit || isSigningUp)
            .padding(.horizontal)
            
            //TODO, add any formatting we want to the log in instead button
            Button {showLoginPage = true}
                label: {
                    Text("Login instead")
                        .foregroundColor(.blue)
                }
                .fullScreenCover(isPresented: $showLoginPage) {
                    LoginPage()
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
    
    private func signUp() {
        errorMessage = nil
        guard canSubmit else {
            errorMessage = "Please enter a valid email and password."
            return
        }
        isSigningUp = true
       
        Auth.auth().createUser(withEmail: email, password: password) { authResult, signUpError in
            if let signUpError = signUpError {
                //shows email/password errors like not long enough password, etc
                self.errorMessage = "Please enter a valid email and password"
                print("Error: \(signUpError.localizedDescription)")
                self.isSigningUp = false
                return
            }
            guard let uid = authResult?.user.uid else {
                self.errorMessage = "Unexpected error: missing user ID."
                self.isSigningUp = false
                return
            }
            addUserToDatabase(uid: uid)
        }
    }
    
    func addUserToDatabase(uid: String) {
        errorMessage = nil
        
        let userData: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "createdAt": Timestamp()
        ]
        
        db.collection("users").document(uid).setData(userData) { error in
            if let error = error {
                
                print("sign up failed: \(error.localizedDescription)")
            } else {
                print("user added")
                showContentPage = true
                
            }
        }
    }
}



#Preview {
    SignUpPage()
}
