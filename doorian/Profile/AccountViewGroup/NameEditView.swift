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
    @Environment(\.presentationMode) var presentationMode
    @State private var errString: String?
    @State private var showUpdateNameAlert: Bool = false
    
    
    private func updateNameUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userData = ["name":self.name, "uid": uid]
        if name != ""{
            Firestore.firestore().collection("users").document(uid)
                .updateData(userData){ err in
                    if let err = err {
                        print("Error updating document name: \(err)")
                    } else {
                        self.showUpdateNameAlert = true
                        print("Document name successfully updated")
                    }
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
                    self.showUpdateNameAlert = true
                
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
                .alert(isPresented: $showUpdateNameAlert) {
                    Alert(title: Text("Password Reset"),
                          message: Text(self.errString ?? "Success! Name update successfully"), dismissButton: .default(Text("OK")) {
                        self.presentationMode.wrappedValue.dismiss()
                        
                    })
                }
               
            }
        }
    }
}

struct NameEditView_Previews: PreviewProvider {
    static var previews: some View {
        NameEditView()
    }
}
