//
//  AccountView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 3/2/2566 BE.
//

import SwiftUI
import FirebaseAuth
//import FirebaseStorage
import SDWebImageSwiftUI

struct AccountView: View {
    
    @ObservedObject private var vm = MainMessagesView()
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
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
                                if let image = self.image {
                                    Image(uiImage: image)
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
                    
                }
                .padding(.horizontal,22)
                .padding(.vertical,20)
                
            }
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil){
                ImagePicker(image: $image)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("bg")
                    .ignoresSafeArea()
            )
        
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
