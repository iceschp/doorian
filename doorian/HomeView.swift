//
//  CustomTabBar.swift
//  doorian
//
//  Created by Warunya on 9/1/2566 BE.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Header()
        }
    }
}

struct Header: View {
    var body: some View {
        VStack {
            Text("สวัสดี! คุณวรัญญา")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
