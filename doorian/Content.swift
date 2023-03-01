//
//  Content.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 1/3/2566 BE.
//

import SwiftUI

struct Content: View {
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    
                    HeaderContent()
                    
                    VStack(alignment: .leading) {
                        Image("durian_image")
                            .resizable()
                            .frame(maxWidth: 360, maxHeight: 160)
                            .cornerRadius(20)
                            .padding(.bottom, 29)
                        
                        
                        
                    }
                }
                .frame(maxWidth: 360)
            }
        }
    }
}


struct HeaderContent: View {
    var body: some View {
        Text("กรมวิชาการเกษตรประกาศทุเรียน หมอนทอง")
            .font(.system(size: 24))
            .bold()
            .padding(.bottom, 6)
    
    }
}

struct DetailUser: View {
    var body: some View {
        Image(systemName: "ladybug")
            .foregroundColor(Color("A3B694"))
            .padding(.trailing, 8)
        
        VStack(alignment: .leading) {
            Text("ข้อมูลทั่วไปของโรคใบไหม้")
                .font(.system(size: 14))
                .bold()
                .foregroundColor(Color("dark-green"))
                .padding(.bottom, 4)
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}
