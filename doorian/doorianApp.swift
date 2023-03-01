//
//  doorianApp.swift
//  doorian
//
//  Created by Warunya on 5/1/2566 BE.
//

import GoogleSignIn
import SwiftUI
import Firebase
import FirebaseCore

@main

struct doorianApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {

//            AuthView()
//            ContentView()
 Content()
            
//    FavoriteView()
//            AccountView()
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        
        return true
    }
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
    -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
