//
//  EmailEditView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 6/3/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct EmailEditView: View {
    
    @AppStorage("uid") var userID: String = ""
    @State private var name: String = ""
    @State private var email: String = ""
    @ObservedObject private var vm = MainMessagesView()
    
    
    private func updateEmailUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userEmail = Auth.auth().currentUser?.email
        let currentUser = Auth.auth().currentUser
        let userData = ["email":self.email, "uid": uid]
    Firestore.firestore().collection("users").document(uid)
        .updateData(userData){ err in
            if let err = err {
                print("Error updating document email: \(err)")
            } else {
                print("Document email successfully updated")
            }
        }
        if email != userEmail{
            currentUser?.updateEmail(to: email){ err in
                if let err = err {
                    print("Error updating email in firebase: \(err)")
                } else {
                    print("Document email successfully updated!")
                }
                
            }
        }
     
      }
    
   
    var body: some View {
        
        ZStack {
            Color(.white).edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                        let email = vm.chatUser?.email.replacingOccurrences(of: "", with: "") ?? ""
                        Text(email)
                        
                        Spacer()
                   
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
                
                
                Button(action: {
                    self.updateEmailUser()
                }) {
                    Text("บันทึก")
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
               
            }
        }
        
    }
}

struct EmailEditView_Previews: PreviewProvider {
    static var previews: some View {
        EmailEditView()
    }
}
