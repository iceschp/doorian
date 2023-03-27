//
//  FavoriteView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 3/2/2566 BE.
//

import SwiftUI

struct FavoriteView: View {

    var body: some View {
        ScrollView (.vertical, showsIndicators: true) {
            
            VStack(alignment: .leading) {
                
                HStack{

                    Text("สิ่งที่ฉันถูกใจ")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 24))
                        .frame(maxWidth: .infinity, alignment: .center)
                   
                }
                Divider()
                    .padding(.top,-10)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15){
                    ForEach(items) { item in
                        
                        CardView(item: item)
                    }
                }
                .padding()
                .padding(.top,-10)
            }
            Spacer(minLength: 0)
            
        }
    }
}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
