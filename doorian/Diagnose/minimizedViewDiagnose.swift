//
//  minimizedViewDiagnose.swift
//  doorian
//
//  Created by Warunya on 14/2/2566 BE.
//

import SwiftUI

struct minimizedViewDiagnose: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image("durian_image")
                        .resizable()
                        .frame(width: 150, height: 170)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading) {
                        Text("โรคใบไหม้ (Leaf Blight)")
                            .font(.system(size: 18))
                            .bold()
                            .padding(.bottom, 6)
                        
                        Group {
                            Text("ข้อมูลทั่วไป")
                                .padding(.bottom, 6)
                            Text("- ใบมีแผลคล้ายถูกน้ำร้อนลวก")
                            Text("- แผลจะขยายตัวและเปลี่ยนเป็นสีน้ำตาล")
                            Text("- มีขนาดและรูปร่าง ไม่แน่นอนลุกลามไปยังใบปกติข้างเคียง")
                        }
                        .font(.system(size: 14))
                    }
                    .padding(.leading, 20)
                }
                .padding(.horizontal, 15)
                .background(.yellow)
                
                VStack {
                    Text("อ่านเพิ่มเติม")
                        .font(.system(size: 12))
                        .foregroundColor(Color("FFEA9A"))
                        .bold()
                        .frame(maxWidth: 180, maxHeight: 26)
                        .background(Color("dark-green"))
                        .cornerRadius(30)
                }
            }
        }
    }
}

struct minimizedViewDiagnose_Previews: PreviewProvider {
    static var previews: some View {
        minimizedViewDiagnose()
    }
}
