//
//  ProfileView.swift
//  doorian
//
//  Created by Warunya on 11/1/2566 BE.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    VStack(spacing: 15){
                        
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        Text("น้องดูเรียน หิวจัง")
                            .font(.custom(
                                "NotoSans-Bold",
                                fixedSize: 18))
                            .fontWeight(.semibold)
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            
                Color("bg")
                    .ignoresSafeArea()
            )
            
        }
    }
}
//
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
