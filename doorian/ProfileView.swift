//
//  ProfileView.swift
//  doorian
//
//  Created by Warunya on 11/1/2566 BE.
//

import SwiftUI
import FirebaseAuth
struct ProfileView: View {
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        Button(action: {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                withAnimation {
                    userID = ""
                }
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        }) {
            Text("Sign Out")
        }
        
    }
}
//
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
