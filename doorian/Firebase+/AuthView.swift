//
//  AuthView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 26/1/2566 BE.
//

import SwiftUI

struct AuthView: View {
//    @State private var currentViewShowing: String = "login" // login or signup
    @State private var isUserCurrentlyLoggedOut : Bool = false
    var body: some View {
        
        NavigationView{
            if self.isUserCurrentlyLoggedOut {
                ContentView()
//                ProfileView(isUserCurrentlyLoggedOut:  $isUserCurrentlyLoggedOut)
                
            }else{
                LoginView(isUserCurrentlyLoggedOut:  $isUserCurrentlyLoggedOut)
            }
        }
        //        if(currentViewShowing == "login") {
        //            LoginView(currentShowingView: $currentViewShowing)
        //
        //        } else {
        //            SignupView(currentShowingView: $currentViewShowing)
        ////            .transition(.move(edge: .bottom))
        //        }
        //
        //    }
    }
}

struct AuthView_Previews: PreviewProvider {
   
    static var previews: some View {
        AuthView()
    }
}
