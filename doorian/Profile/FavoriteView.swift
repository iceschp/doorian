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
                
//                LazyVGrid(columns: self.columns){
//
//                    ForEach(data){durian in
//
//                        GridView(durian: durian)
//                    }
//                }
            }
            
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
//struct DurianContent : Identifiable {
//    var id: Int
//    var name : String
//    var image : String
//    var rating : Int
//}
//
//var data = [
//
//    DurianContent(id: 0, name: "โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d0", rating: 4),
//    DurianContent(id: 1, name: "โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d1", rating: 3),
//    DurianContent(id: 2, name: "โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d2", rating: 2),
//    DurianContent(id: 3, name: "โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d3", rating: 1),
//    DurianContent(id: 4, name: "โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d4", rating: 3),
//    DurianContent(id: 5, name: "โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d2", rating: 5),
//    
//]

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
