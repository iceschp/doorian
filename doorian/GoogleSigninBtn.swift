//
//  GoogleSigninBtn.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 25/1/2566 BE.
//

import SwiftUI

struct GoogleSigninBtn: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                Image("google")
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: 200, height: 50)
    }
}

struct GoogleSigninBtn_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSigninBtn(action: {})
    }
}
