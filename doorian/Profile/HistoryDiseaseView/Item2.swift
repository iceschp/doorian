//
//  Item2.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 2/3/2566 BE.
//

import SwiftUI

    struct Item2: Identifiable {
        var id = UUID().uuidString
        var date : String
        var time : String
        var disease : String
        var image : String
        var province : String

    }


    var item2 = [

        Item2(date: "6 ธันวาคม 2565", time:"10:30",disease: "โรคใบไหม้", image: "d0", province: "กรุงเทพมหานคร"),
        Item2(date: "6 ธันวาคม 2565", time:"10:30",disease: "โรคใบไหม้", image: "d0", province: "กรุงเทพมหานคร"),
        Item2(date: "6 ธันวาคม 2565", time:"10:30",disease: "โรคใบไหม้", image: "d0", province: "กรุงเทพมหานคร"),
        Item2(date: "6 ธันวาคม 2565", time:"10:30",disease: "โรคใบไหม้", image: "d0", province: "กรุงเทพมหานคร"),
        Item2(date: "6 ธันวาคม 2565", time:"10:30",disease: "โรคใบไหม้", image: "d0", province: "กรุงเทพมหานคร"),

    ]
