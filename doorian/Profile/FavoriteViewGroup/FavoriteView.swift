//
//  FavoriteView.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 3/2/2566 BE.
//

import SwiftUI

struct FavoriteView: View {
//    @State var columns = Array{ repeating: GridItem(.flexible(), spacing: 15), count: 2}
    var body: some View {
        ScrollView (.vertical, showsIndicators: true) {
            
            VStack(alignment: .leading) {
                
                HStack{
                    
                    Text("สิ่งที่ฉันถูกใจ")
                        .font(.custom(
                            "NotoSans-Bold",
                            fixedSize: 28))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding()
                 
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15){
                    ForEach(items) { item in
                        
                        CardView(item: item)
                    }
                }
                .padding()
//                LazyVGrid(columns: self.columns){
//
//                    ForEach(data){durian in
//
//                        GridView(durian: durian)
//                    }
//                }
            }
            Spacer(minLength: 0)
            
        }
    }
}

//struct GridView : View {
//    
//    var durian : DurianContent
//    
//    var body: some View{
//        
//        VStack{
//            
//            Image(durian.image)
//                .resizable()
//                .frame(height: 250)
//                .cornerRadius(20)
//        }
//    }
//}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
