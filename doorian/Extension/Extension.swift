//
//  Extension.swift
//  doorian
//
//  Created by Warunya on 1/2/2566 BE.
//

import Foundation
import SwiftUI

public extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
