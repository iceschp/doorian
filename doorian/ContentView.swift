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
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("หน้าแรก")
                    }
                ScanningView()
                    .tabItem {
                        Image(systemName: "viewfinder")
                    }
                ProfileView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
                    .tabItem {
                        Image(systemName: "person")
                        Text("โปรไฟล์")
                    }
            }
            .accentColor(Color("dark-green"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
