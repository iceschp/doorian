//
//  ResultFullView.swift
//  doorian
//
//  Created by Warunya on 14/2/2566 BE.
//

import SwiftUI

struct ResultFullView: View {
    var body: some View {
        VStack {
            HeaderDisease()
            
            VStack(alignment: .leading) {
                Image("durian_image")
                    .resizable()
                    .frame(maxWidth: 360, maxHeight: 160)
                    .cornerRadius(20)
                    .padding(.bottom, 29)
                
                SciSection()
                GeneralDetail()
                
            }
        }
        .frame(maxWidth: 360)
    }
}
struct HeaderDisease: View {
    var body: some View {
        Text("โรคใบไหม้")
            .font(.system(size: 24))
            .bold()
            .padding(.bottom, 6)
        
        Text("ประเภทเชื้อรา")
            .font(.system(size: 14))
            .padding(.bottom, 26)
    }
}

struct SciSection: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("ชื่อวิทยาศาสตร์")
                    .padding(.bottom, 10)
                Text("สาเหตุ")
            }
            .font(.system(size: 14))
            .bold()
            .foregroundColor(Color("dark-green"))
            .padding(.trailing, 15)
            
            VStack(alignment: .leading) {
                Text("Leaf Blight")
                    .padding(.bottom, 10)
                Text("เชื้อราไรซอกโทเนีย (Rhizoctonia sp.)")
            }
            .font(.system(size: 14))
        }
        .padding(.bottom, 30)
    }
}

struct GeneralDetail: View {
    var body: some View {
        HStack(alignment: .top) {
            Group {
                Image(systemName: "ladybug")
                    .foregroundColor(Color("A3B694"))
                    .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text("ข้อมูลทั่วไปของโรคใบไหม้")
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(Color("dark-green"))
                        .padding(.bottom, 4)
                    
                    Text("โรคใบไหม้ หรือ โรคใบติด ที่เกิดจากเชื้อราไรซอกโทเนีย (Rhizoctonia sp.) พบได้ทั้งในระยะพัฒนาผลไปจนถึง ระยะเก็บเกี่ยว")
                        .font(.system(size: 14))
                }
            }
            .padding(10)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("grey-light"), lineWidth: 1)
        )
    }
}

struct ResultFullView_Previews: PreviewProvider {
    static var previews: some View {
        ResultFullView()
    }
}
