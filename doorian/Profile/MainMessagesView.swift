//
//  MainMessagesView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 3/2/2566 BE.
//

import SwiftUI
import Firebase

struct ChatUser {
    let uid, email, name, profileImageUrl: String
}

//struct ContentDetail{
//    let uid, author, contentP1, contentP2, date, image, imageName, topic  : String
//}


class MainMessagesView: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var chatUser: ChatUser?
//    @Published var list = [Content]
//    @Published var contentDetail: ContentDetail?
    
    init() {
        fetchCurrentUser()
//        Content()
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
                let uid = data["uid"] as? String ?? ""
                let email =  data["email"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let profileImageUrl = data["profileImageUrl"] as? String ?? ""
                
                self.chatUser = ChatUser(uid: uid, email: email, name: name, profileImageUrl: profileImageUrl)
            }
    }
    
//    private func Content(){
//
//        guard let uid = Auth.auth().currentUser?.uid else{
//            self.errorMessage = "Could not find firebase uid"
//            return
//        }
//
//        Firestore.firestore().collection("Content")
//            .document(uid).getDocument { snapshot, error in
//
//                if let error = error {
//                    self.errorMessage = "Failed to fetch current user: \(error)"
//                    print("Failed to fetch current user",error)
//                    return
//                }
//                self.errorMessage = "123"
//
//                guard let data = snapshot?.data() else {
//                    self.errorMessage = "No datat found"
//                    return
//                }
//                self.errorMessage = "Data: \(data.description)"
//                let uid = data["uid"] as? String ?? ""
//                let author =  data["author"] as? String ?? ""
//                let contentP1 = data["contentP1"] as? String ?? ""
//                let contentP2 = data["contentP2"] as? String ?? ""
//                let date = data["date"] as? String ?? ""
//                let image = data["image"] as? String ?? ""
//                let imageName = data["imageName"] as? String ?? ""
//                let topic = data["topic"] as? String ?? ""
//
//
//                self.contentDetail = ContentDetail(uid: uid, author: author, contentP1: contentP1, contentP2: contentP2, date: date, image: image, imageName: imageName, topic: topic)
//            }
//    }
    
    
}
