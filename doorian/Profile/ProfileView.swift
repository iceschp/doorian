//
//  ProfileView.swift
//  doorian
//
//  Created by Warunya on 11/1/2566 BE.
//

import SwiftUI
import FirebaseAuth
import SDWebImageSwiftUI
struct ProfileView: View {
    
    @AppStorage("uid") var userID: String = ""
    @ObservedObject private var vm = MainMessagesView()
    @State var shouldShowLogoutOption = false
    @Binding var isUserCurrentlyLoggedOut  : Bool
    
    var body: some View {
        
        NavigationView{
            
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack{
                        
                        VStack(spacing: 15){
                            
//                            WebImage(url: URL(string: vm.chatUser?.profileImageUrl ?? ""))
                            HStack{
                                Image("fono")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .offset(y: -40)
                                    .padding(.bottom,-40)
                                
                            }
                            
                            HStack(alignment: .top, spacing: 10){
                                
                                let name = vm.chatUser?.name.replacingOccurrences(of: "", with: "") ?? ""
                                Text(name)
                                    .font(.custom(
                                        "NotoSans-Bold",
                                        fixedSize: 18))
                                    .fontWeight(.semibold)
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.white)
                        }
                        .padding([.horizontal,.bottom])
                        .background(
                            Color("4F704B")
                            .cornerRadius(12)
                        )
                        .padding()
                        .padding(.top,40)
                        

                        HStack{
                            NavigationLink(destination: AccountView()) {
                                Image(systemName: "person.fill")
                                Text("บัญชีผู้ใช้")
                                    .font(.custom("NotoSans-Bold", size: 16))
                                   
                                    
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.custom("NotoSans-Bold", size: 16))
                                    
                            }
                        }
                        .foregroundColor(Color("4F704B"))
                        .padding()
                        .background(
                        
                            Color("gray-white")
                                .cornerRadius(12)
                        )
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                        HStack{
                            NavigationLink(destination: ChangePasswordView()) {
                                Image(systemName: "lock.fill")
                                Text("รหัสผ่าน")
                                    .font(.custom("NotoSans-Bold", size: 16))
                                    
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.custom("NotoSans-Bold", size: 16))
                                    
                            }
                        }
                        .foregroundColor(Color("4F704B"))
                        .padding()
                        .background(
                        
                            Color("gray-white")
                                .cornerRadius(12)
                        )
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                        HStack{
                            NavigationLink(destination: FavoriteView()) {
                                Image(systemName: "heart.fill")
                                Text("สิ่งที่ฉันถูกใจ")
                                    .font(.custom("NotoSans-Bold", size: 16))
                                   
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.custom("NotoSans-Bold", size: 16))
                                    
                            }
                        }
                        .foregroundColor(Color("4F704B"))
                        .padding()
                        .background(
                        
                            Color("gray-white")
                                .cornerRadius(12)
                        )
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                        HStack{
                            NavigationLink(destination: HistoryDisease()) {
                                Image(systemName: "clock.arrow.circlepath")
                                Text("ประวัติการบันทึกโรค")
                                    .font(.custom("NotoSans-Bold", size: 16))
                                    
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.custom("NotoSans-Bold", size: 16))
                                    
                            }
                        }
                        .foregroundColor(Color("4F704B"))
                        .padding()
                        .background(
                        
                            Color("gray-white")
                                .cornerRadius(12)
                        )
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                        HStack{
                            Button {
                                shouldShowLogoutOption.toggle()
                            } label: {
                                    Image(systemName: "rectangle.portrait.and.arrow.forward.fill")
                                        .foregroundColor(Color("dark-pink"))
                                    Text("ออกจากระบบ")
                                        .font(.custom("NotoSans-Bold", size: 16))
                                        .foregroundColor(Color("dark-pink"))
                                    
                                    Spacer()
                                    
                                   
                                }
                            
                        }
                        .foregroundColor(.black)
                        .padding()
                        .background(
                        
                            Color("gray-white")
                                .cornerRadius(12)
                        )
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                    }.padding(.horizontal,22)
                     .padding(.vertical,20)
                     .actionSheet(isPresented: $shouldShowLogoutOption) {
                         .init(title: Text("Sign out"), message:Text("คณต้องการออกจากสู่ระบบหรือไม่?"), buttons: [
                            .destructive(Text("ยืนยัน"), action: {
                                print("handle sign out")
                                try? Auth.auth().signOut()
                                self.isUserCurrentlyLoggedOut = false
                            }),
                            .cancel(Text("ยกเลิก"))
                         ])
                     }
                   
               //สำรองไว้ก่อน
//                    VStack{
//                        Button(action: {
//                            let firebaseAuth = Auth.auth()
//                            do {
//                                try firebaseAuth.signOut()
//                                withAnimation {
//                                    userID = ""
//                                }
//                            } catch let signOutError as NSError {
//                                print("Error signing out: %@", signOutError)
//                            }
//                        }) {
//                            Text("ออกจากระบบ")
//                        }
//                    }
//                    .padding(.vertical,30)
                    
                }
                .navigationBarHidden(true)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color(.white)
                        .ignoresSafeArea()
                )
                
           
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    @State static var isUserCurrentlyLoggedOut = false
    static var previews: some View {
        ProfileView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
    }
}

