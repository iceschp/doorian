//
//  CardView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 16/2/2566 BE.
//

import SwiftUI

struct CardView: View {
    var item: Item
  
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16.0){
            
            Image(item.image)
                .resizable()
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            cardText.padding(.horizontal, 8)
            
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24.0))
        .shadow(radius: 8)
       
    }
    
    var cardText: some View{
        VStack(alignment: .leading){
            Text(item.topic)
                .font(.custom(
                    "NotoSans-Bold",
                    fixedSize: 12))
            HStack(spacing: 2.0){
                Image(systemName: "person.circle.fill")
                Text(item.name)
                    .padding()
                    .font(.custom(
                        "NotoSans-Regular",
                        fixedSize: 12))
                
                Spacer(minLength: 0)
                
                    Button(action:{}){
                        Image(systemName: "heart.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                    Text(item.rating)
                        .font(.custom(
                            "NotoSans-Regular",
                            fixedSize: 12))
                
            }.foregroundColor(.gray)
                .padding(.bottom,2)
        }
        
    }
}
