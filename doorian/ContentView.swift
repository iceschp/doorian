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
                        Image(systemName: "house")
                        Text("หน้าแรก")
                    }
                ScanningView()
                    .tabItem {
                        Image(systemName: "viewfinder")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("โปรไฟล์")
                    }
            }
            .accentColor(Color("button"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
