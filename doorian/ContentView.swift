//
//  ContentView.swift
//  doorian
//
//  Created by Warunya on 5/1/2566 BE.
//

import SwiftUI

struct ContentView: View {
//    @State var selectedTab: Tabs = .home
    
    var body: some View {
        VStack {
            CustomTabbar()
        }
//        VStack {
//            Spacer()
//            CustomTabbar(selectedTab: $selectedTab)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
