//
//  ProfileView.swift
//  doorian
//
//  Created by Warunya on 11/1/2566 BE.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
