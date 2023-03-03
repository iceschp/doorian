//
//  ResetPasswordView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 27/1/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ResetPasswordView: View {
    @State private var email: String = ""
    @AppStorage("uid") var userID: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var errString: String?
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("bg").edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Image("doorian_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                    .padding(.top)
                    HStack{
                        Text("ลืมรหัสผ่าน?")
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 24))
                    }
                    .padding()
                    HStack{
                        Text("กรุณากรอกอีเมลของคุณที่ช่องด้านล่าง")
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 14))
                    }
                    HStack{
                        Text("เราจะทำการส่งอีเมลตั้งรหัสผ่านใหม่ให้แก่คุณ!")
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 14))
                    }
                    
                    HStack{
                        Image(systemName: "mail")
                        TextField("อีเมล", text: $email)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        
                        
                        Spacer()
                        if(email.count != 0) {
                            Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                        
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color("textfield"))
                    )
                    .padding()
                    
                    Button(action: {
                        ResetEmailAuth.resetPassword(email: self.email) { (result) in
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
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Password Reset"),
                      message: Text(self.errString ?? "Success! Reset email sent successfully"), dismissButton: .default(Text("OK")) {
                    self.presentationMode.wrappedValue.dismiss()
                })
            }
        }
    }
}

struct ResetEmailAuth{
    static func resetPassword(email:String, resetCompletion:@escaping (Result<Bool,Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            if let error = error {
                resetCompletion(.failure(error))
            } else {
                resetCompletion(.success(true))
            }
            
        })
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
   
    static var previews: some View {
        ResetPasswordView()
    }
}
