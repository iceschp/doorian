//
//  OpeningView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 27/1/2566 BE.
//

import SwiftUI

struct OpeningView: View {
    var body: some View {
        ZStack{
            Color("bg").edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .padding()
                }
                .padding(.top)
                HStack{
                    Text("Doorian")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 45))
                }
                .padding()
                HStack{
                    Text("Application for diagnose diseases")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 12))
                }
                HStack{
                    Text("from durian leaf by Machine Learning.")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 12))
                }
            }
        }
    }
}

struct OpeningView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}
