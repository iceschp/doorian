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
import GoogleSignIn

struct SignupView: View {
    @Binding var isUserCurrentlyLoggedOut  : Bool
    @AppStorage("uid") var userID: String = ""
    @State private var name: String = ""
    @State private var profileImageUrl: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State var visible = false
    
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
                HStack {
                    Image("doorian_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                }
                .padding(.top)
                HStack{
                    Text("??????????????????????????????????????????!")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 24))
                    
                    
                }
                HStack{
                    Image(systemName: "person.fill")
                    TextField("??????????????????????????????", text: $name)
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
                    TextField("???????????????", text: self.$email)
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
                            TextField("????????????????????????", text: self.$password)
                                .font(.system(size: 14))
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        }
                        else{
                            SecureField("????????????????????????",text: self.$password)
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
                    self.isUserCurrentlyLoggedOut = true
                }
                    
                } label: {
                    Text("?????????????????????????????????")
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
                
                Text("????????????")
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
                        Text("??????????????????????????????????????????????????????????????????????????????????????????")
                            .foregroundColor(.black.opacity(0.7))
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 14))
                        Text("?????????????????????????????????!")
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
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    @State static var isUserCurrentlyLoggedOut = false
    static var previews: some View {
        SignupView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
    }
}
