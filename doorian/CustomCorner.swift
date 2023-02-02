//
//  CustomCorner.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 2/2/2566 BE.
//

import SwiftUI

struct CustomCorner: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii:CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
