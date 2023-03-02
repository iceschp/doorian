//
//  GroupView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 2/3/2566 BE.
//

import SwiftUI

struct GroupView: View {
    var item2: Item2
  
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack {
                Image(item2.image)
                    .resizable()
                    .frame(width: 100, height: 80)
                    .cornerRadius(20)
               
                VStack{
                    HStack{
                        Text(item2.date)
                            .font(.system(size: 10))
                            .padding(.bottom, 8)
                        
                        Text(",")
                            .font(.system(size: 10))
                            .padding(.bottom, 8)
                            .padding(.leading, -8)
                        
                        Text(item2.time)
                            .font(.system(size: 10))
                            .padding(.bottom, 8)
                            .padding(.leading, -6)
                    }
                    Text(item2.disease)
                        .font(.system(size: 12))
                        .padding(.bottom, 8)
                        .bold()
                    HStack{
                        Image(systemName: "mappin")
                            .foregroundColor(Color("DE5B6D"))
                            .font(.system(size: 10))
                            .padding(.bottom, 8)
                        
                        
                        Text(item2.province)
                            .font(.system(size: 10))
                            .padding(.bottom, 8)
                            .padding(.leading, -4)
                    }
                 
                }
                .padding(.leading, 30)
                .padding(.trailing, 5)
                .foregroundColor(Color("0B0B0B"))
               
               
            }
            .padding(.horizontal, 5)
            
        }
        
    }
    
   
}
