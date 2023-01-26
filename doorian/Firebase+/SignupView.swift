//
//  SignupView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 26/1/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

struct SignupView: View {
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State var error = ""
    
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 8 characters long
        // 1 uppercase character
        // 1 lowerrcase character
        // 1 special char
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}")
        
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack {
            Color("textbg").edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                }
                .padding(.top)
                HStack{
                    Text("สร้างบัญชีใหม่!")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 24))
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
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                )
                .padding()
                
                HStack{
                    Image(systemName: "lock")
                    SecureField("รหัสผ่าน", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    
                    Spacer()
                    
                    if(password.count != 0) {
                        
                        Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                            .foregroundColor(isValidPassword(password) ? .green : .red)
                    }
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                )
                .padding()
                
                Button{Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    
                    if let error = error {
                        print(error)
                        return
                    }
                    
                    if let authResult = authResult {
                        print(authResult.user.uid)
                        userID = authResult.user.uid
                        
                    }
                }
                    
                } label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                        )
                        .padding(.horizontal)
                }
                
                Spacer()
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.currentShowingView = "login"
                    }
                }) {
                    Text("คุณมีบัญชีผู้ใช้แล้วใช่หรือไม่")
                        .foregroundColor(.black.opacity(0.7))
                    
                }
                Text("หรือ")
                    .padding()
                GoogleSigninBtn {
                    
                    FireAuth.share.signinWithGoogle(presenting: getRootViewController()) { errror in
                        print("ERROR: \(error)")
                    }
                }
            }
        }
    }
}
