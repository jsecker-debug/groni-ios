//
//  groniApp.swift
//  groni
//
//  Created by Joshua Secker on 25/02/2025.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    // Sign out any existing user for testing
    try? Auth.auth().signOut()
    return true
  }
}

@main
struct groniApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var authService = AuthService.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    if authService.isAuthenticated {
                        MainView()
                    } else {
                        SignInView()
                    }
                }
            }
        }
    }
}
