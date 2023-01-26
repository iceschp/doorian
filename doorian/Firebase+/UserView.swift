//
//  UserView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 26/1/2566 BE.
//

import SwiftUI
import FirebaseAuth

struct UserView: View {
    
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        NavigationView {
            if userID == "" {
                AuthView()
                
            } else {
                ContentView()
                
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
