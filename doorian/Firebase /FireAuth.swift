//
//  FireAuth.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 25/1/2566 BE.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import Firebase

//struct FireAuth {
//
//    static let share = FireAuth()
//
//    private init() {}
//
//    func signinWithGoogle(presenting: UIViewController,
//                          completion: @escaping (Error?) -> Void) {
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//
//        // Create Google Sign In configuration object.
//        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
//        GIDSignIn.sharedInstance.signIn(with: config, presenting: presenting) {user, error in

//          if let error = error {
//              completion(error)
//            return
//          }
//
//          guard
//            let authentication = user?.authentication,
//            let idToken = authentication.idToken
//          else {
//            return
//          }

//          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                         accessToken: authentication.accessToken)
//
//            Auth.auth().signIn(with: credential) { result, error in
//                guard error == nil else {
//                    completion(error)
//                    return
//                }
//                print("SIGN IN")
//                UserDefaults.standard.set(true, forKey: "signIn") // When this change to true, it will go to the home screen
//            }
//        }
//    }
//}

