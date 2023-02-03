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
                        

                        HStack{
                            NavigationLink(destination: AccountView()) {
                                Image(systemName: "person.fill")
                                Text("บัญชีผู้ใช้")
                                    .font(.custom("NotoSans-Regular", size: 18))
                                    
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                        }
                        .foregroundColor(.black)
                        .padding()
                        .background(
                        
                            Color.white
                                .cornerRadius(12)
                        )
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                        HStack{
                            NavigationLink(destination: AccountView()) {
                                Image(systemName: "lock.fill")
                                Text("รหัสผ่าน")
                                    .font(.custom("NotoSans-Regular", size: 18))
                                    
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                        }
                        .foregroundColor(.black)
                        .padding()
                        .background(
                        
                            Color.white
                                .cornerRadius(12)
                        )
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                        HStack{
                            NavigationLink(destination: AccountView()) {
                                Image(systemName: "heart.fill")
                                Text("สิ่งที่ฉันถูกใจ")
                                    .font(.custom("NotoSans-Regular", size: 18))
                                    
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                        }
                        .foregroundColor(.black)
                        .padding()
                        .background(
                        
                            Color.white
                                .cornerRadius(12)
                        )
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                        HStack{
                            NavigationLink(destination: AccountView()) {
                                Image(systemName: "clock.arrow.circlepath")
                                Text("ประวัติการบันทึกโรค")
                                    .font(.custom("NotoSans-Regular", size: 18))
                                    
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                        }
                        .foregroundColor(.black)
                        .padding()
                        .background(
                        
                            Color.white
                                .cornerRadius(12)
                        )
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                        HStack{
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
                                    Image(systemName: "rectangle.portrait.and.arrow.forward.fill")
                                        .foregroundColor(Color("dark-pink"))
                                    Text("ออกจากระบบ")
                                        .font(.custom("NotoSans-Regular", size: 18))
                                        .foregroundColor(Color("dark-pink"))
                                    
                                    Spacer()
                                    
                                   
                                }
                            
                        }
                        .foregroundColor(.black)
                        .padding()
                        .background(
                        
                            Color.white
                                .cornerRadius(12)
                        )
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                    }.padding(.horizontal,22)
                     .padding(.vertical,20)
                   
               //สำรองไว้ก่อน
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
                    Color("bguser")
                        .ignoresSafeArea()
                )
                
           
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

