//
//  MinimizedViewNotification.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 1/3/2566 BE.
//

import SwiftUI

struct MinimizedViewNotification: View {
    var body: some View {
        NavigationView{
                ZStack {
                    VStack(alignment: .leading) {
                       
                            Text("อำเภอเมือง, จังหวัดจันทบุรี")
                                .font(.system(size: 18))
                                .bold()
                                .padding()
                                .padding(.bottom, 6)
                                .foregroundColor(Color("4F704B"))
                        
                        HStack {
                            Image("durian_image")
                                .resizable()
                                .frame(width: 150, height: 170)
                                .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                Text("โรคที่พบ:")
                                    .font(.system(size: 12))
                                    .padding(.bottom, 8)
                                  
                                Text("ระดับความรุนแรง:")
                                    .font(.system(size: 12))
                                    .padding(.bottom, 8)
                                Text("ระยะเวลาที่เกิดโรค:")
                                    .font(.system(size: 12))
                                    .padding(.bottom, 8)
                                
                                Text("แนวทางป้องกัน:")
                                    .font(.system(size: 12))
                                    .padding(.bottom, 8)
                                
                            }
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                            .bold()
                            .foregroundColor(Color("0B0B0B"))
                            
                            VStack(alignment: .leading) {
                                Text("โรคใบใหม้")
                                    .font(.system(size: 12))
                                    .padding(.bottom, 8)
                                Text("8/10 (รุนแรงมาก)")
                                    .font(.system(size: 12))
                                    .padding(.bottom, 8)
                                Text("วันที่ 1 ธันวาคม 2565")
                                    .font(.system(size: 12))
                                    .padding(.bottom, 8)
                                Text("ตัดพุ่มให้โปร่ง เพื่อรับแสงแดด และหากพบเจอใบที่เป็น โรคให้นำไปเผาทำลายทิ้ง")
                                    .font(.system(size: 12))
                              
                            }
                            .foregroundColor(Color("0B0B0B"))
                            .padding(.leading, -5)
                            .padding(.bottom, -38)
                           
                        }
                        .padding(.horizontal, 5)
                    }
                }
        }
    }
}

struct MinimizedViewNotification_Previews: PreviewProvider {
    static var previews: some View {
        MinimizedViewNotification()
    }
}
