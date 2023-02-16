//
//  Item.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 16/2/2566 BE.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var name : String
    var topic : String
    var image : String
    var rating : String

}


var items = [

    Item(name: "สมชาย", topic:"โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d0", rating: "4"),
    Item(name: "สมชาย", topic:"โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d1", rating: "3"),
    Item(name: "สมชาย", topic:"โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d2", rating: "2"),
    Item(name: "สมชาย", topic:"โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d3", rating: "1"),
    Item(name: "สมชาย", topic:"โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d4", rating: "3"),
    Item(name: "สมชาย", topic:"โรคใบไหม้ที่ชาวสวนปลูกทุเรียน ต้องระวัง!!",image: "d2", rating: "5"),

]
