//
//  HistoryDisease.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 2/3/2566 BE.
//

import SwiftUI

struct HistoryDisease: View {
    var body: some View {
        ScrollView (.vertical, showsIndicators: true) {
            
            VStack(alignment: .leading) {
                
                HStack{
                    
                    Text("ประวัติ")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 28))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                .padding()
                 
                VStack(alignment: .leading, spacing: 20){
                    ForEach(item2) { item2 in
                        
                        GroupView(item2: item2)
                        Divider()
                    }
                    
                }
                .padding()
                .padding(.bottom, 5)
            }
            Spacer(minLength: 0)
            
        }
    }
}

struct HistoryDisease_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDisease()
    }
}
