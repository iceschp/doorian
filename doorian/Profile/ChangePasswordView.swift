//
//  ChangePasswordView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 2/3/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ChangePasswordView: View {
    @State var oldPassword: String = ""
    @State var newPassword: String = ""
    @State var confirmPassword : String = ""
    @State var visible = false
    @State private var showAlert = false
    @State private var showView = false
    @State private var errString: String?
    @Environment(\.presentationMode) var presentationMode
    
    
    @AppStorage("uid") var userID: String = ""
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 8 characters long
        // 1 uppercase character
        // 1 lowerrcase character
        // 1 special char
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~])[A-Za-z\\dd$#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]{8,}")
        
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                ZStack{
                    VStack {
                        
                        HStack {
                            Text("เปลี่ยนรหัสผ่านใหม่")
                                .font(.custom(
                                    "NotoSans-Bold",
                                    fixedSize: 24))
                        }
                        .padding(.bottom, 10)
                        
                        VStack{
                            HStack {
                                Text("รหัสผ่านปัจจุบัน")
                                    .font(.custom(
                                        "NotoSans-Bold",
                                        fixedSize: 18))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.leading, 20)
                            
                            HStack {
                                Image(systemName: "lock.fill")
                                VStack{
                                    if self.visible{
                                        TextField("รหัสผ่าน", text: $oldPassword)
                                            .font(.system(size: 14))
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
                                    }
                                    else{
                                        SecureField("รหัสผ่าน", text: $oldPassword)
                                            .font(.system(size: 14))
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
                                    }
                                }
                                Spacer()
                                
                                if (oldPassword.count != 0) {
                                    
                                    Image(systemName: isValidPassword(oldPassword) ? "checkmark" : "xmark")
                                        .foregroundColor(isValidPassword(oldPassword) ? .green : .red)
                                }
                                Button(action: {
                                    self.visible.toggle()
                                }) {
                                    Image(systemName: self.visible ? "eye" : "eye.slash" )
                                        .font(.system(size: 14))
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
                            .padding()
                            .padding(.top, -20)
                        }
                        .padding(.top, 20)
                        VStack{
                            HStack {
                                Text("รหัสผ่านใหม่")
                                    .font(.custom(
                                        "NotoSans-Bold",
                                        fixedSize: 18))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.leading, 20)
                            
                            HStack {
                                Image(systemName: "lock.fill")
                                VStack{
                                    if self.visible{
                                        TextField("รหัสผ่าน", text: $newPassword)
                                            .font(.system(size: 14))
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
                                    }
                                    else{
                                        SecureField("รหัสผ่าน", text: $newPassword)
                                            .font(.system(size: 14))
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
                                    }
                                }
                                Spacer()
                                
                                if (newPassword.count != 0) {
                                    
                                    Image(systemName: isValidPassword(newPassword) ? "checkmark" : "xmark")
                                        .foregroundColor(isValidPassword(newPassword) ? .green : .red)
                                }
                                Button(action: {
                                    self.visible.toggle()
                                }) {
                                    Image(systemName: self.visible ? "eye" : "eye.slash" )
                                        .font(.system(size: 14))
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
                            .padding()
                            .padding(.top, -20)
                        }
                        .padding(.top, -10)
                        
                        VStack{
                            HStack {
                                Text("ยืนยันรหัสผ่านใหม่")
                                    .font(.custom(
                                        "NotoSans-Bold",
                                        fixedSize: 18))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.leading, 20)
                            
                            HStack {
                                Image(systemName: "lock.fill")
                                VStack{
                                    if self.visible{
                                        TextField("รหัสผ่าน", text: $confirmPassword)
                                            .font(.system(size: 14))
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
                                    }
                                    else{
                                        SecureField("รหัสผ่าน", text: $confirmPassword)
                                            .font(.system(size: 14))
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
                                    }
                                }
                                Spacer()
                                
                                if (confirmPassword.count != 0) {
                                    
                                    Image(systemName: isValidPassword(confirmPassword) ? "checkmark" : "xmark")
                                        .foregroundColor(isValidPassword(confirmPassword) ? .green : .red)
                                }
                                Button(action: {
                                    self.visible.toggle()
                                }) {
                                    Image(systemName: self.visible ? "eye" : "eye.slash" )
                                        .font(.system(size: 14))
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
                            .padding()
                            .padding(.top, -20)
                        }
                        .padding(.top, -10)
                        
                        Button(action: {
                            ChangePasswordAuth.changePassword(password: self.confirmPassword) { (result) in
                                switch result {
                                case .failure(let error):
                                    self.errString = error.localizedDescription
                                case .success( _):
                                    break
                                }
                                self.showAlert = true
                                
                            }
                        }
                        ){
                            Text("ยืนยัน")
                                .foregroundColor(.white)
                                .font(.title3)
                                .bold()
                            
                                .frame(maxWidth: .infinity)
                                .padding()
                            
                                .background(
                                    RoundedRectangle(cornerRadius: 50)
                                        .fill(Color("dark-green"))
                                )
                                .padding(.horizontal)
                            
                        }
                        
                    }
                    
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Password Reset"),
                      message: Text(self.errString ?? "Success! Reset email sent successfully"), dismissButton: .default(Text("OK")) {
                    self.presentationMode.wrappedValue.dismiss()
                    
                    //                    self.showView = true
                    
                    
                })
            }
        }
    }
}
struct ChangePasswordAuth{
    static func changePassword(password:String, resetCompletion:@escaping (Result<Bool,Error>) -> Void) {
        Auth.auth().currentUser?.updatePassword(to: password, completion: { (error) in
            if let error = error {
                resetCompletion(.failure(error))
            } else {
                resetCompletion(.success(true))
            }
            
        })
    }
}
struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
