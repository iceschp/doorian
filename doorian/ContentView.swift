//
//  ContentView.swift
//  doorian
//
//  Created by Warunya on 5/1/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("หน้าแรก")
                }
            ScanningView()
                .tabItem {
                    Image(systemName: "viewfinder")
                    Color.red
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("โปรไฟล์")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
