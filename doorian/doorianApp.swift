//
//  doorianApp.swift
//  doorian
//
//  Created by Warunya on 5/1/2566 BE.
//

import SwiftUI
import Firebase

@main

struct doorianApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate 
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            SignIn()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
