//
//  MainMessagesView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 3/2/2566 BE.
//

import SwiftUI
import Firebase

struct ChatUser {
    let uid, email, profileImageUrl: String
}

class MainMessagesView: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var chatUser: ChatUser?
    
    init() {
        fetchCurrentUser()
    }
    
    private func fetchCurrentUser(){
        
        guard let uid = Auth.auth().currentUser?.uid else{
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        Firestore.firestore().collection("users")
            .document(uid).getDocument { snapshot, error in
                
                if let error = error {
                    self.errorMessage = "Failed to fetch current user: \(error)"
                    print("Failed to fetch current user",error)
                    return
                }
                self.errorMessage = "123"
                
                guard let data = snapshot?.data() else {
                    self.errorMessage = "No datat found"
                    return
                }
                self.errorMessage = "Data: \(data.description)"
                let uid = data["uid"] as? String
            }
        
    }
}

