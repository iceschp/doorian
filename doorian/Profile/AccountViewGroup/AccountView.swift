//
//  AccountView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 3/2/2566 BE.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
//import SDWebImageSwiftUI

struct AccountView: View {
    
    @ObservedObject private var vm = MainMessagesView()
    @AppStorage("uid") var userID: String = ""
//    @State var shouldShowImagePicker = false
    @State private var name: String = ""
    @State private var email: String = ""
  
    
    
//    @State var selectedImage: UIImage?
    var body: some View {
        
        
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    Text("บัญชีผู้ใช้")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 28))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15){
                        
                        VStack{
                            NavigationLink(destination: NameEditView()){
                                Image("doorian_profile")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 90, height: 90)
                                    .clipShape(Circle())
                                    .offset(y: -40)
                                    .padding(.bottom,-40)
                                    .padding(.leading, 75)
                                
                                Image(systemName: "camera.fill")
                                    .foregroundColor(Color.black)
                                    .background(Color.gray)
                                    .frame(width: 70, height: 70)
                                    .clipShape(Circle())
                                    .offset(y: -10)
                                    .offset(x: -50)
                                    .padding(.bottom,-40)
                            }
                        }
                               
                        HStack(alignment: .top, spacing: 10){

                        let name = vm.chatUser?.name.replacingOccurrences(of: "", with: "") ?? ""
                        Text("@\(name)")
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 18))
                            .fontWeight(.semibold)
                            .padding(.top,15)
                         
                    
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Spacer()
                        
                    } // Vstack 15
                    .padding([.horizontal,.bottom])
                    .background(
                        Color.white
                            .cornerRadius(12)
                    )
                    .padding()
                    .padding(.top,40)
            
                    
                    HStack{
                        Text("ชื่อผู้ใช้")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        NavigationLink(destination: NameEditView()){
                            let name = vm.chatUser?.name.replacingOccurrences(of: "", with: "") ?? ""
                            Text(name)
                            
                            Spacer()
                            
                            Image(systemName: "pencil")
                        }
                    }
                    .foregroundColor(Color.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 18)
                    .background(
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color("textfield"))
                    )
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        Text("อีเมล์")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        NavigationLink(destination: EmailEditView()){
                            let email = vm.chatUser?.email.replacingOccurrences(of: "", with: "") ?? ""
                            Text(email)
                            
                            Spacer()
                            
                            Image(systemName: "pencil")
                        }
                    }
                    .foregroundColor(Color.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 18)
                    .background(
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color("textfield"))
                    )
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(.horizontal,22)
                .padding(.vertical,20)
                
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("bg")
                    .ignoresSafeArea()
            )
            
        }
        
    
}
    
//    func uploadPhoto() {
//
//        guard selectedImage != nil else {
//            return
//        }
//        let storageRef = Storage.storage().reference()
//
//        let imageData = selectedImage!.jpegData( compressionQuality: 0.8)
//
//        guard imageData != nil else{
//            return
//        }
//
//        let fileRef = storageRef.child("userprofile/\(UUID().uuidString).jpg")
//
//        let uploadTask = fileRef.putData(imageData!, metadata: nil){ metadata, error in
//
//            if error == nil && metadata != nil {
//                print("error")
//            }
//
//        }
//    }


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
