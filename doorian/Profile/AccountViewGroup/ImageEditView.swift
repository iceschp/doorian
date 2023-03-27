////
////  ImageEditView.swift
////  doorian
////
////  Created by Samitanun Sapsukdee on 21/3/2566 BE.
////
//
//import SwiftUI
//import FirebaseStorage
//import Firebase
//import FirebaseFirestore
//
//struct ImageEditView: View {
//    @State var shouldShowImagePicker = false
//    @State var selectedImage: UIImage?
//    @AppStorage("uid") var userID: String = ""
//    @State private var profileImageUrl: String = ""
//    @State private var showUpdateImageAlert: Bool = false
//    
////    private func updateImageUser(){
////        guard let uid = Auth.auth().currentUser?.uid else { return }
////        let userData = ["profileImageUrl":self.profileImageUrl, "uid": uid]
////        if profileImageUrl != ""{
////            Firestore.firestore().collection("users").document(uid)
////                .updateData(userData){ err in
////                    if let err = err {
////                        print("Error updating document name: \(err)")
////                    } else {
////                        self.showUpdateImageAlert = true
////                        print("Document image successfully updated")
////                    }
////                }
////        }
////
////      }
////
//    var body: some View {
//
//        VStack {
//
//            if selectedImage != nil {
//                Image(uiImage: selectedImage!)
//                    .resizable()
//                    .scaledToFit()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 80, height: 80)
//                    .clipShape(Circle())
//                    .offset(y: -40)
//                    .padding(.bottom,-40)
//                    .padding()
//            }
//
//            Button {
//
//                //Show the image picker
//                shouldShowImagePicker = true
//            } label: {
//                Text("Select a Photo")
//            }
//            //Upload button
//            if selectedImage != nil {
//                Button {
//                    //Upload the image
//                    uploadPhoto()
//                } label: {
//                    Text("Upload photo")
//                }
//            }
//
//        }
//        .sheet(isPresented: $shouldShowImagePicker, onDismiss: nil) {
//            //Image picker
//            ImagePicker(image: $selectedImage)
//        }
//
//    }
//    func uploadPhoto() {
//
//        //Make sure that the selected image property isn't nil
//        guard selectedImage != nil else {
//            return
//        }
//
//        //Create storage reference
//        let storageRef = Storage.storage().reference()
//
//        //Turn our image into data
//        let imageData = selectedImage!.jpegData( compressionQuality: 0.8)
//
//        //Check that we were able to convert it to data
//        guard imageData != nil else {
//            return
//        }
//
//        //Specify the file path and name
//        let fileRef = storageRef.child("userprofile2/\(UUID().uuidString).jpg")
//
//        //Upload that data
//        let uploadTask = fileRef.putData(imageData!, metadata: nil){ metadata, error in
//
//            //Check for errors
//            if error == nil && metadata != nil {
//
//                //Save a reference to the file in Firestore DB
//
////                let db = Firestore.firestore()
////                db.collection("users").document().setData(["url":])
//            }
//        }
//    }
//}
//
//
//struct ImageEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageEditView()
//    }
//}
