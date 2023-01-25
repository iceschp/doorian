//
//  View.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 25/1/2566 BE.
//

import SwiftUI

extension View{
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }

        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        

        return root
    }
}
