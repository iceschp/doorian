//
//  SuccessPasswordView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 27/1/2566 BE.
//

import SwiftUI

struct SuccessPasswordView: View {
    var body: some View {
        ZStack{
            Color("bg").edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image("success")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding()
                }
                .padding(.top)
                HStack{
                    Text("สำเร็จแล้ว")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 24))
                }
                .padding()
                
                HStack{
                    Text("หากคุณไม่ได้รับอีเมลดังกล่าว ?")
                        .foregroundColor(.black.opacity(0.7))
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 14))
                    Text("ส่งอีกครั้ง")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 14))
                }
                
                .padding()
                Button{
                    
                } label:{
                    Text("กลับสู่หน้าแรก")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .fill(Color("button"))
                        )
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct SuccessPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessPasswordView()
    }
}
