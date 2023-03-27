//
//  SignupView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 26/1/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import GoogleSignIn

struct SignupView: View {
    @Binding var isUserCurrentlyLoggedOut  : Bool
    @AppStorage("uid") var userID: String = ""
    @State private var name: String = ""
    @State private var profileImageUrl: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State var visible = false
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @State private var StatusMessage : String = ""
    @State private var handle : String = ""
    @Environment(\.dismiss) var dismiss
    
    @State var error = ""
    
    
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 8 characters long
        // 1 uppercase character
        // 1 lowerrcase character
        // 1 special char
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~])[A-Za-z\\dd$#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]{8,}")
        
        return passwordRegex.evaluate(with: password)
    }
    
    private func storeUserInformation(){
          guard let uid = Auth.auth().currentUser?.uid else { return }
        let userData = ["name": self.name, "email": self.email,"profileImageUrl": "profile", "uid": uid]
          Firestore.firestore().collection("users")
              .document(uid).setData(userData) { error in
                
                  if let error = error {
                      print(error)
                      return
                  }
                  print("success")
              }
      }

    
    var body: some View {
        ZStack {
            Color(.white).edgesIgnoringSafeArea(.all)
            VStack {
                Button{
                    shouldShowImagePicker.toggle()
                } label: {
                    
                    HStack {
                        
                        if let image = self.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 128, height: 128)
                                .cornerRadius(64)
                        }else{
                            
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                                .foregroundColor(Color("bright-green"))
                        }
                    }
                    .overlay(RoundedRectangle(cornerRadius: 64)
                        .stroke(Color("bright-green"), lineWidth: 3)
                    )
                    .padding(.bottom, 20)
                }
                HStack{
                    Text("สร้างบัญชีใหม่!")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 24))
                    
                    
                }
                HStack{
                    Image(systemName: "person.fill")
                    TextField("ชื่อผู้ใช้", text: $name)
                        .font(.system(size: 14))
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    Spacer()
                }
                .foregroundColor(Color("bright-green"))
                .padding(.vertical, 10)
                .padding(.horizontal, 18)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color("textfield"))
                )
                .padding(.bottom, 20)
                
                HStack {
                    Image(systemName: "envelope.fill")
                    TextField("อีเมล", text: self.$email)
                        .font(.system(size: 14))
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    Spacer()
                    
                    if(email.count != 0) {
                        
                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                }
                .foregroundColor(Color("bright-green"))
                .padding(.vertical, 10)
                .padding(.horizontal, 18)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color("textfield"))
                )
                .padding(.bottom, 20)
                
                HStack {
                    
                    Image(systemName: "lock.fill")
                   
                    VStack{
                        
                        if self.visible{
                            TextField("รหัสผ่าน", text: self.$password)
                                .font(.system(size: 14))
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        }
                        else{
                            SecureField("รหัสผ่าน",text: self.$password)
                                .font(.system(size: 14))
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        }
                    }
                    
                    if(password.count != 0) {
                        
                        Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                            .foregroundColor(isValidPassword(password) ? .green : .red)
                    }
                    Button(action: {
                        self.visible.toggle()
                    }) {
                        Image(systemName: self.visible ? "eye" : "eye.slash" )
                            
                    }
                    
                }
                .foregroundColor(Color("bright-green"))
                .padding(.vertical, 10)
                .padding(.horizontal, 18)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color("textfield"))
                )
                .padding(.bottom, 20)
                
                
                Button { Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    
                    if let error = error {
                        print(error)
                        return
                    }
                   
                    self.storeUserInformation()
                    if let authResult = authResult {
                        print(authResult.user.uid)
                        userID = authResult.user.uid
                    }
//                    persisImageToStorage()
                    self.isUserCurrentlyLoggedOut = true
                }
                    
                } label: {
                    Text("สมัครสมาชิก")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                    
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color("dark-green"))
                        )
                }
                .padding(.bottom, 20)
                
                Text("หรือ")
                    .font(.custom(
                        "NotoSans-Bold",
                        fixedSize: 14))
                    .padding(.bottom, 20)
                
                GoogleSigninBtn {
                    FireAuth.share.signinWithGoogle(presenting: getRootViewController()) { errror in
                        print("ERROR: \(error)")
                    }
                }
                .padding(.bottom, 20)
                
                Button(action: {
                    dismiss()
//                    withAnimation {
//                        self.currentShowingView = "login"
//                    }
                }) {
                    HStack {
                        Text("คุณมีบัญชีผู้ใช้แล้วใช่หรือไม่")
                            .foregroundColor(.black.opacity(0.7))
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 14))
                        Text("เข้าสู่ระบบ!")
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 14))
                            .foregroundColor(Color("dark-green"))
                    }
                }
                .padding(.bottom, 20)
                
                
            }
            .frame(width: 300, height: 35)
        }
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
   
//    private func persisImageToStorage() {
//        guard let uid = Auth.auth().currentUser?.uid else {return}
//        let ref = Storage.storage().reference().child("/userprofile/\(uid).jpg")
//        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
//        ref.putData(imageData, metadata: nil) { metadata, error in
//            if let error = error {
//                self.StatusMessage = "Failed to push image to Storage: \(error)"
//                return
//            }
//            ref.downloadURL { url, error in
//                if let error = error {
//                    self.StatusMessage = "Failed to retrieve downloadURL: \(error)"
//                    return
//                }
//
//                self.StatusMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
//                print("success")
//            }
//        }
//    }
    
      
}

struct SignupView_Previews: PreviewProvider {
    @State static var isUserCurrentlyLoggedOut = false
    static var previews: some View {
        SignupView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
    }
}
