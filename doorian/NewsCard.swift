//
//  NewsCard.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 16/2/2566 BE.
//

import SwiftUI

struct NewsCard: View {
    var item: Item //ยืมข้อมูลมาใช้ก่อนเด่วค่อยเปลี่ยน
    
    var body: some View {
        VStack{
        Image(item.image)
            .resizable()
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .cornerRadius(20)
            .overlay(alignment: .leading){
                Text("กรมวิชาการเกษตรประกาศทุเรียนหมอนทอง")
                    .font(.custom(
                        "NotoSans-Bold",
                        fixedSize: 16))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                Text("ทุเรียนหมอนทองปรับปรุงพันธุ์")
                    .font(.custom(
                        "NotoSans-Regular",
                        fixedSize: 14))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 60)
                    .padding(.leading, -110)
            }
            }
        }
    }


