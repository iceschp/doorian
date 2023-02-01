//
//  LoginView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 26/1/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

struct LoginView: View {
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var visible = false
    @State var error = ""
    
    @State private var showingSheet = false
    
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
            ZStack {
                Color(.white).edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Image("doorian_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                    .padding(.top)
                    
                    HStack {
                        Text("ยินดีต้อนรับสู่ Doorian!")
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 24))
                    }
                    
                    HStack {
                        Image(systemName: "envelope.fill")
                        TextField("อีเมล", text: $email)
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
                                TextField("รหัสผ่าน", text: $password)
                                    .font(.system(size: 14))
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                            }
                            else{
                                SecureField("รหัสผ่าน", text: $password)
                                    .font(.system(size: 14))
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                            }
                        }
                        Spacer()
                        
                        if (password.count != 0) {
                            
                            Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                                .foregroundColor(isValidPassword(password) ? .green : .red)
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
                    
                    HStack {
                        Image(systemName: "checkmark.square")
                        Text("จดจำรหัสผ่าน")
                            .bold()
                        Spacer()
                        VStack{
                            NavigationLink(destination: ResetPasswordView()) {
                                Text("ลืมรหัสผ่าน ?")
                                    .bold()
                            }
                        }
                    }
                    .font(.system(size: 14))
                    .foregroundColor(Color("dark-green"))
                    .padding(.bottom, 20)
                    
                    Button {
                        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                            if let error = error {
                                print(error)
                                return
                            }
                            
                            if let authResult = authResult {
                                print(authResult.user.uid)
                                withAnimation {
                                    userID = authResult.user.uid
                                }
                            }
                        }
                        
                    } label: {
                        Text("เข้าสู่ระบบ")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .bold()
                        
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                        
                            .background(
                                RoundedRectangle(cornerRadius: 50)
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
                        showingSheet.toggle()
                        //                        withAnimation {
                        //                            self.currentShowingView = "signup"
                        //                        }
                        
                    }
                    ) {
                        Text("คุณยังไม่ได้สมัครสมาชิกหรือไม่")
                            .foregroundColor(.black.opacity(0.7))
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 14))
                        Text("สมัครสมาชิก!")
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 14))
                            .foregroundColor(Color("dark-green"))
                    }
                    .padding(.bottom, 20)
                    
                }
                .frame(width: 300, height: 35)
            }
            .sheet(isPresented: $showingSheet) {
                SignupView(currentShowingView: .constant("true"))
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
            }
            
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(currentShowingView: .constant("true"))
    }
}
