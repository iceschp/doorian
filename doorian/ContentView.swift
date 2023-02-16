//
//  ContentView.swift
//  doorian
//
//  Created by Warunya on 5/1/2566 BE.
//

import SwiftUI


struct ContentView: View {

    @State private var isUserCurrentlyLoggedOut : Bool = false
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    

    var body: some View {
        
        VStack {

            CustomTabbar()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
