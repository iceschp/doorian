//
//  ContentTodayNews.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 1/3/2566 BE.
//

import SwiftUI

struct ContentTodayNews: View {
    var body: some View {
       
        NavigationView{
            
                ScrollView (.vertical, showsIndicators: false) {
                    VStack {
                       
                        FavoriteBtnT()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        VStack(alignment: .leading){
                            
                            HeaderContentT()
                            
                            DetailUserT()
                        }
                        VStack(alignment: .leading) {
                            Image("durian_image")
                                .resizable()
                                .frame(maxWidth: 360, maxHeight: 160)
                                .cornerRadius(20)
                                .padding(.bottom, 8)
                        }
                        
                        ImageNameT()
                            .padding()
                        ContentT1()
                            .padding(.bottom, 8)
                        ContentT2()
                    }
                    .frame(maxWidth: 360)
                }
            }
        }
}

struct FavoriteBtnT: View {
    var body: some View {
        Image(systemName: "heart")
            .foregroundColor(Color("545454"))
            .font(.system(size: 20))
            .padding(.bottom, 4)
    }
}

struct HeaderContentT: View {
    var body: some View {
            Text("กรมวิชาการเกษตรประกาศทุเรียน หมอนทอง")
                .font(.system(size: 24))
                .bold()
                .foregroundColor(Color("025711"))
                .padding(.bottom, 8)
          
    }
}

struct DetailUserT: View {
    var body: some View {
       
        HStack{
            
                Group{
                    
                    Image(systemName: "person")
                        .foregroundColor(Color("4F4F4F"))
                        .font(.system(size: 14))
                        .padding(.bottom, 4)
                    Text("วรัญญา แสงชมภู")
                        .font(.system(size: 10))
                        .bold()
                        .foregroundColor(Color("4F4F4F"))
                        .padding(.bottom, 4)
                    
                }
                Group{
                    Image(systemName: "clock")
                        .foregroundColor(Color("4F4F4F"))
                        .font(.system(size: 14))
                        .padding(.bottom, 4)
                    Text("1 มกราคม 2566")
                        .font(.system(size: 10))
                        .bold()
                        .foregroundColor(Color("4F4F4F"))
                        .padding(.bottom, 4)
                }
            }
    }
}

struct ImageNameT: View {
var body : some View {
        VStack(alignment: .center){
            Text("ทุเรียนหมอนทองปรับปรุงพันธุ์")
                .font(.system(size: 10))
                .bold()
                .foregroundColor(Color("828282"))
                .padding(.bottom, 4)
        
        }
    }
}

struct ContentT1: View {
var body : some View {
        VStack(alignment: .center){
            Group{
                Text("10 เมษายน 2561 นายสุวิทย์ ชัยเกียรติยศ อธิบดีกรมวิชา การเกษตร เปิดเผยว่าประเทศไทยเป็นประเทศผู้ผลิตทุเรียน รายใหญ่ของโลก โดยมีแหล่งผลิตที่สำคัญอยู่ในภาคตะวัน ออกและภาคใต้ ซึ่งได้มีการปรับปรุงพันธุ์ทุเรียนมาอย่าง ต่อเนื่องให้ตรงความต้องการตลาดทั้งในประเทศและต่าง ประเทศ เพื่อให้ได้พันธุ์ที่อายุการเก็บเกี่ยวสั้นและมีผลผลิต สูงออกสู่ตลาดก่อนพันธุ์ที่ปลูกเป็นการค้าหลักคือพันธุ์หมอนทอง โดยศูนย์วิจัยพืชสวนจันทบุรี สถาบันวิจัยพืชสวน ได้วิจัยทุเรียนพันธุ์ใหม่ จำนวน 3 พันธุ์ คือ จันทบุรี 7 จันทบุรี 8 และจันทบุรี 9")
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(Color("828282"))
                    .padding(.bottom, 4)
            }
        }
    }
}

struct ContentT2: View {
var body : some View {
        VStack(alignment: .center){
            Group{
                Text("โดยทุเรียนพันธุ์จันทบุรี 7 มีอายุการเก็บเกี่ยวสั้น มีอายุเก็บ เกี่ยวเพียง 95 วัน หลังดอกบาน มีคุณภาพดีเด่นด้าน รสชาติและคุณภาพในการรับประทานใกล้เคียงกับพันธุ์มาตรฐานที่เป็นการค้าในปัจจุบัน เช่น ชะนีและหมอนทอง มีเนื้อ ละเอียด สีเนื้อมีสีเหลืองเข้ม เหนียว รสชาติหวาน มัน อร่อยและกลิ่นอ่อนมีรูปทรงผลกลมรี ก้านผลยาว 5.8 เซนติเมตร ความหนาเปลือก 1.6 เซนติเมตร ความหนาเนื้อ 0.9 เซนติเมตร พื้นที่แนะนำให้ปลูกในภาคตะวันออก เช่น จังหวัดจันทบุรี ตราด และระยอง")
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(Color("828282"))
                    .padding(.bottom, 4)
            }
        }
    }
}
struct ContentTodayNews_Previews: PreviewProvider {
    static var previews: some View {
        ContentTodayNews()
    }
}
