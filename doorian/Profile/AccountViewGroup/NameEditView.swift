//
//  NameEditView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 6/3/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct NameEditView: View {
    @AppStorage("uid") var userID: String = ""
    @State private var name: String = ""
    @State private var email: String = ""
    @ObservedObject private var vm = MainMessagesView()
    
    
    private func updateNameUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let currentUser = Auth.auth().currentUser
        let userData = ["name":self.name, "uid": uid]
    Firestore.firestore().collection("users").document(uid)
        .updateData(userData){ err in
            if let err = err {
                print("Error updating document name: \(err)")
            } else {
                print("Document name successfully updated")
            }
        }

      }
    
    var body: some View {
        ZStack {
            Color(.white).edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                        let name = vm.chatUser?.name.replacingOccurrences(of: "", with: "") ?? ""
                        Text(name)
                        
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
                    Image(systemName: "person.fill")
                    TextField("ชื่อผู้ใช้", text: self.$name)
                        .font(.system(size: 14))
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
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
                    self.updateNameUser()
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

struct NameEditView_Previews: PreviewProvider {
    static var previews: some View {
        NameEditView()
    }
}
