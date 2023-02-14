//
//  ResultFullView.swift
//  doorian
//
//  Created by Warunya on 14/2/2566 BE.
//

import SwiftUI

struct ResultFullView: View {
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
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
                        FullDetail()
                        HowToCure()
                        Instruction()
                        
                    }
                }
                .frame(maxWidth: 360)
            }
        }
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
        .frame(maxWidth: 360)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("grey-light"), lineWidth: 1)
        )
    }
}

struct FullDetail: View {
    var body: some View {
        HStack(alignment: .top) {
            Group {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("A3B694"))
                    .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text("อาการของโรคใบไหม้")
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(Color("dark-green"))
                        .padding(.bottom, 4)
                    
                    Text("- เริ่มแรกจะพบบนใบมีแผลคล้ายถูกน้ำร้อนลวก \n - ต่อมาแผลจะขยายตัวและเปลี่ยนเป็นสีน้ำตาล มีขนาดและ รูปร่างไม่แน่นอน จากนั้นจะลุกลามไปยังใบปกติข้างเคียง \n - กรณีที่มีความชื้นสูง เชื้อราดังกล่าวจะสร้างเส้นใยคล้ายใย แมงมุมยึดใบให้ติดกัน ใบที่เป็นโรคจะไหม้ แห้งหลุดร่วงไปสัมผัส กับใบด้านล่าง ทำให้โรคระบาดลุกลามจนเห็นใบไหม้เกิดเป็นหย่อมๆ \n - ใบจะร่วงจนเหลือแต่กิ่ง และกิ่งแห้งในที่สุด ทำให้ต้นทุเรียน เสียรูปทรง")
                        .font(.system(size: 14))
                }
            }
            .padding(10)
        }
        .frame(maxWidth: 360)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("grey-light"), lineWidth: 1)
        )
    }
}

struct HowToCure: View {
    var body: some View {
        HStack(alignment: .top) {
            Group {
                Image(systemName: "wand.and.stars")
                    .foregroundColor(Color("A3B694"))
                    .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text("วิธีการแก้ไข")
                        .bold()
                        .foregroundColor(Color("dark-green"))
                        .padding(.bottom, 4)
                    
                    Text("ฉีดพ่นสารกำจัดเชื้อราที่ใบให้ทั่วทั้งต้นด้วย")
                    
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(Color("FFC700"))
                        Text("Recommend: เฮกซะโคนาโซล 5% SC")
                    }
                    .frame(maxWidth: 300, minHeight: 27)
                    .cornerRadius(10)
                    .background(Color("FEFCCB"))
                    
                    Text("- คอปเปอร์ไฮดรอกไซด์ 77% WP \n- คอปเปอร์ออกซีคลอไรด์ 85% WP\n- คอปเปอร์ออกซีคลอไรด์ 65.2% WG \n- เพนทิโอไพแรด 20%SC")
                    
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(Color("FFC700"))
                        Text("Tips: ผสมน้ำในอัตราส่วนตามที่ระบุไว้ใน ฉลากคำแนะนำ และฉีดพ่นทุก 7 วัน")
                    }
                    .frame(maxWidth: 300, minHeight: 47)
                    .cornerRadius(10)
                    .background(Color("FEFCCB"))
                }
            }
            .font(.system(size: 14))
            .padding(10)
        }
        .frame(maxWidth: 360)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("grey-light"), lineWidth: 1)
        )
    }
}

struct Instruction: View {
    var body: some View {
        HStack(alignment: .top) {
            Group {
                Image(systemName: "checkmark.shield")
                    .foregroundColor(Color("A3B694"))
                    .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text("แนวทางป้องกัน")
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(Color("dark-green"))
                        .padding(.bottom, 4)
                    
                    Text("-ควรหมั่นตรวจแปลงปลูกอย่างสม่ำเสมอ \n- ตัดส่วนและเก็บเศษพืชที่เป็นโรค และใบที่ร่วงหล่นนำไปทำลาย นอกแปลงปลูก \n- ตัดแต่งกิ่งมีทรงพุ่มโปร่ง เพื่อให้ทุเรียนได้รับแสงแดด และอากาศถ่ายเทได้ดี \n- ไม่ควรใส่ปุ๋ยที่มีไนโตรเจนสูงสำหรับแปลงปลูกที่มีความชื้นสูงและมีการระบาดของโรคเป็นประจำ")
                        .font(.system(size: 14))
                }
            }
            .padding(10)
        }
        .frame(maxWidth: 360)
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
