//
//  ProfileView.swift
//  doorian
//
//  Created by Warunya on 11/1/2566 BE.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        
        NavigationView{
            
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack{
                        
                        Text("โปรไฟล์ของฉัน")
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 28))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 15){
                            
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .offset(y: -40)
                                .padding(.bottom,-40)
                            Text("อริสา มีสุข")
                                .font(.custom(
                                    "NotoSans-Bold",
                                    fixedSize: 18))
                                .fontWeight(.semibold)
                            
                            
                            HStack(alignment: .top, spacing: 10){
                                
                                Text("@alisa_meesuk")
                                    .font(.custom(
                                        "NotoSans-Regular",
                                        fixedSize: 14))
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding([.horizontal,.bottom])
                        .background(
                            Color.white
                            .cornerRadius(12)
                        )
                        .padding()
                        .padding(.top,40)
                        
                        CustomNavigationLink(title: "บัญชีผู้ใช้"){
                           
                            Text("")
                                .navigationTitle("บัญชีผู้ใช้")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white.ignoresSafeArea())
                            
                        }
                        CustomNavigationLink(title: "รหัสผ่าน"){
                            
                            Text("")
                                .navigationTitle("รหัสผ่าน")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white.ignoresSafeArea())
                            
                        }
                        CustomNavigationLink(title: "สิ่งที่ฉันถูกใจ"){
                            
                            Text("")
                                .navigationTitle("สิ่งที่ฉันถูกใจ")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white.ignoresSafeArea())
                            
                        }
                        CustomNavigationLink(title: "ประวัติการบันทึกโรค"){
                            
                            Text("")
                                .navigationTitle("ประวัติการบันทึกโรค")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white.ignoresSafeArea())
                            
                        }
                        
                    }.padding(.horizontal,22)
                     .padding(.vertical,20)
                   
                    
                    VStack{
                        Button(action: {
                            let firebaseAuth = Auth.auth()
                            do {
                                try firebaseAuth.signOut()
                                withAnimation {
                                    userID = ""
                                }
                            } catch let signOutError as NSError {
                                print("Error signing out: %@", signOutError)
                            }
                        }) {
                            Text("ออกจากระบบ")
                        }
                    }
                    .padding(.vertical,30)
                    
                }
                .navigationBarHidden(true)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color("bg")
                        .ignoresSafeArea()
                )
                
           
        }
    }
    
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String, @ViewBuilder content: @escaping ()->Detail)->some View{
        
        NavigationLink{
            content()
        } label: {
            
            HStack{
                
                Text(title)
                    .font(.custom("NotoSans-Regular", size: 18))
                    
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(
            
                Color.white
                    .cornerRadius(12)
            )
            .padding(.horizontal)
            .padding(.top,10)
           
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
