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
                    .padding(.bottom, 23)
                ContentDisplay()
            }
        }
    }
}

struct Header: View {
    @ObservedObject private var vm = MainMessagesView()
    
    var body: some View {
        ZStack (alignment: .top){
            VStack {
                let name = vm.chatUser?.name.replacingOccurrences(of: "", with: "") ?? ""
                
                Text("สวัสดี! คุณ\(name)")
                    .bold()
                    .font(.custom("NotoSans", size: 24))
                    .padding(.bottom, 5)
                
                Text("อัปเดตข่าวสารทุเรียนวันที่ 1 มกราคม 2566")
                    .font(.system(size: 14))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 150)
            .background(Color("bright-green"))
            
            Location()
                .padding(.top, 135)
        }
    }
}

struct Location: View {
    var body: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
                .foregroundColor(Color("bright-green"))
            Text("กรุงเทพมหานคร")
                .bold()
                .font(.system(size: 14))
        }
        .frame(width: 360, height: 30)
        .background(.white)
        .cornerRadius(100)
        .shadow(radius: 4, x: 0, y: 2)
    }
}

struct ContentDisplay: View {
    var body: some View {
        VStack(alignment: .leading) {
            GeneralNews()
            
            Spacer()
            
            TodayNews()
        }
        .padding(.horizontal, 15)
        .frame(maxWidth: .infinity)
    }
}

struct GeneralNews: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("ประกาศทั่วไป")
                .bold()
                .font(.system(size: 18))
        }
    }
}

struct TodayNews: View {
    @State var index = 0
    var body: some View {
        VStack(alignment: .leading) {
            Text("ข่าววันนี้")
                .bold()
                .font(.system(size: 18))
            
            TabView(selection: self.$index){
    
                ForEach(0...4,id: \.self){index in
                    
                    Image("d\(index)")
                        .resizable()
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(20)
                        .tag(index)
                    
                }
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .padding(.top)
            .tabViewStyle(PageTabViewStyle())
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
