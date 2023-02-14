//
//  ResultView.swift
//  doorian
//
//  Created by Warunya on 14/2/2566 BE.
//

import SwiftUI

struct ResultView: View {
    @State private var showingSheet = true
    
    var body: some View {
        ZStack {
            Image("durian_temp1")
                .resizable()
                .ignoresSafeArea()
        }
        .sheet(isPresented: $showingSheet) {
            MinimizedViewDiagnose()
                .presentationDetents([.height(280)])
                .presentationDragIndicator(.visible)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
