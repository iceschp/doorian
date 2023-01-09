//
//  ContentView.swift
//  doorian
//
//  Created by Warunya on 5/1/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected: Tab = .house
        
        init() {
            UITabBar.appearance().isHidden = true
        }
        
        var body: some View {
            ZStack {
                VStack {
                    TabView(selection: $tabSelected) {
                        ForEach(Tab.allCases, id: \.rawValue) { tab in
                            HStack {
//                                Image(systemName: tab.rawValue)
//                                Text("\(tab.rawValue.capitalized)")
                                Text("หน้า Home")
                                    .bold()
                                    
                                    .animation(nil, value: tabSelected)
                            }
                            .tag(tab)
                            
                        }
                    }
                }
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $tabSelected)
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
