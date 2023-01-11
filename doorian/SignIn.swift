//
//  SignIn.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 17/1/2566 BE.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    let auth  = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email,
                    password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //Success
                self?.signedIn = true
            }
        }
    }
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                //Success
                self?.signedIn = true
            }
        }
    }
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
}


struct SignIn: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView {
                
            if viewModel.isSignedIn {
                VStack {
                    Text("You are signed in")
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("ออกจากระบบ")
                            .frame(width: 200, height: 50)
                            .background(Color.green)
                            .foregroundColor(Color.blue)
                            .padding()
                    })
                }
            }
            else{
                    SignInDetail()
                }
            }
            .onAppear{
                viewModel.signedIn = viewModel.isSignedIn
            }
        }
    }


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}

struct SignInDetail: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            VStack {
                Text("ยินดีต้อนรับสู่ Doorian!")
                TextField("อีเมล", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color("textbg"))
                
                SecureField("รหัสผ่าน", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color("textbg"))
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signIn(email: email, password: password)
                    
                } , label: {
                    Text("เข้าสู่ระบบ")
                        .foregroundColor(Color.yellow)
                        .frame(width: 200, height: 50)
                        .background(Color("button"))
                        .cornerRadius(20.0)
                    
                })
                NavigationLink("สมัครสมาชิก",destination: SignUpView())
                    .padding()
            }
            .padding()
            .padding()
            .background(Color.white)
            .cornerRadius(25.0)
        }
    }
}


struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            VStack {
                Text("สร้างบัญชีใหม่!")
                TextField("อีเมล", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color("textbg"))
                
                SecureField("รหัสผ่าน", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color("textbg"))
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signUp(email: email, password: password)
                    
                } , label: {
                    Text("สมัครสมาชิก")
                        .foregroundColor(Color.yellow)
                        .frame(width: 200, height: 50)
                        .background(Color("button"))
                        .cornerRadius(20.0)
                    
                })
                NavigationLink("เข้าสู่ระบบ",destination: SignIn())
            }
            .padding()
            .padding()
            .background(Color.white)
            .cornerRadius(25.0)
        }
    }
}
