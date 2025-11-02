//
//  FoodFeedApp.swift
//  FoodFeed
//
//  Created by Ellie on 10/4/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main
struct FoodFeedApp: App {
    @State private var isLoggedIn: Bool? = nil
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView{

                //if logged in, go to home page, else go to signup page
                if isLoggedIn == nil{
                   ProgressView("Loading...")
                }
                else if isLoggedIn == true{
                    ContentView()
                }
                else{
                    SignUpPage()
                }
            }
            .onAppear {
                checkLoginState()
            }
        }
    }

//checks if the user was logged in or not when the app loads
private func checkLoginState() {
    if let user = Auth.auth().currentUser {
        print("The following user was logged in: \(user.email  ?? "unknown")")
        isLoggedIn = true
    } else {
        print("User is not logged in")
        isLoggedIn = false
    }
}
}


        
