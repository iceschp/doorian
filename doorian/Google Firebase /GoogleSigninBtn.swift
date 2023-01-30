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
                HStack{
                    Image("googleicon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 30)
                        
                    Text("Google")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                }
                .frame(width: 150, height: 35)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                    .fill(Color.red)
                )
            }
        }
      
    }
}

struct GoogleSigninBtn_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSigninBtn(action: {})
    }
}
