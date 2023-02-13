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
    @State var shouldShowImagePicker = false
    @State private var name: String = ""
    @State private var email: String = ""
    
    @State var selectedImage: UIImage?
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    Text("บัญชีผู้ใช้")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 28))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15){
                        
                        Button{
                            shouldShowImagePicker.toggle()
                        } label: {
                            VStack{
                                if selectedImage != nil {
                                    Image(uiImage: selectedImage!)
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        .offset(y: -40)
                                        .padding(.bottom,-40)
                                }else{
                                    
                                    
                                    //                        WebImage(url: URL(string: vm.chatUser?.profileImageUrl ?? ""))
                                    Image("doorian_profile")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        .offset(y: -40)
                                        .padding(.bottom,-40)
                                    Image(systemName: "camera.fill")
                                        .foregroundColor(Color.black)
                                        .background(Color.red)
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                        .offset(y: -70)
                                        .offset(x: 30)
                                        .padding(.bottom,-40)
                                }
                                
                            }
                            
                        }
                        //ติดปัญหาอยู่
//                        if selectedImage != nil {
//                            Button{
//                                uploadPhoto()
//                            } label: {
//                                Text("Upload photo")
//                                    .padding()
//                            }
//
//                        }
                        
                        let name = vm.chatUser?.name.replacingOccurrences(of: "", with: "") ?? ""
                        Text(name)
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 18))
                            .fontWeight(.semibold)
                        
                        
                        HStack(alignment: .top, spacing: 10){
                            
                            Text("@doorian_อริสา")
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
                        Text("ชื่อผู้ใช้")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        let name = vm.chatUser?.name.replacingOccurrences(of: "", with: "") ?? ""
                        Text(name)
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
                        let email = vm.chatUser?.email.replacingOccurrences(of: "", with: "") ?? ""
                        Text(email)
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
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil){
                ImagePicker(image: $selectedImage)
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
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
