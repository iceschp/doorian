//
//  CustomTabBar.swift
//  doorian
//
//  Created by Warunya on 9/1/2566 BE.
//

import SwiftUI
import Firebase

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: true) {
                Header()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bright-green"))
        }
    }
}

struct Header: View {
    var body: some View {
        VStack {
            Text("สวัสดี! คุณวรัญญา")
                .bold()
                .font(.system(size: 24))
                .padding(.bottom, 5)
            
            Text("อัปเดตข่าวสารทุเรียนวันที่ 1 มกราคม 2566")
                .font(.system(size: 14))
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
