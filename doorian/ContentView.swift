//
//  ContentView.swift
//  doorian
//
//  Created by Warunya on 5/1/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("หน้าแรก", systemImage: "house")
                    }
                ScanningView()
                    .tabItem {
                        Label("", systemImage: "viewfinder")
                    }
                ProfileView()
                    .tabItem {
                        Label("โปรไฟล์", systemImage: "person")
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
