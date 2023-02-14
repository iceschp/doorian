//
//  ResultView.swift
//  doorian
//
//  Created by Warunya on 14/2/2566 BE.
//

import SwiftUI

struct ResultView: View {
    
    var body: some View {
        ZStack {
            Image("durian_temp1")
                .resizable()
                .ignoresSafeArea()
            
            MinimizedViewDiagnose()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
