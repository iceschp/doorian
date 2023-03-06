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
    @State private var fullText: String = "This is some editable text..."
    
    private func storeUserInformation(){
          guard let uid = Auth.auth().currentUser?.uid else { return }
        let userData = ["name": self.name, "email": self.email,"profileImageUrl": "profile", "uid": uid]
          Firestore.firestore().collection("users")
              .document(uid).updateData(userData) { error in
                
                  if let error = error {
                      print(error)
                      return
                  }
                  print("success")
              }
      }
   
    var body: some View {
        
     Text("hello")
        
    }
}

struct EmailEditView_Previews: PreviewProvider {
    static var previews: some View {
        EmailEditView()
    }
}
