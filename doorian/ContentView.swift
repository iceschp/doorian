//
//  ContentView.swift
//  doorian
//
//  Created by Warunya on 5/1/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomTabBarView()
    }
}

struct TabLabel : View {
    var text : String
    var imageName : String
    var color : Color
    
    var body : some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.bottom, 2)
            Text(text).font(.system(size: 10))
        }.foregroundColor(color)
    }
}

struct TabButton : View {
    @Binding var currentSelection : Int
    
    var selectionIndex : Int
    var label : TabLabel
    
    var body : some View {
        Button(action: {
            self.currentSelection = self.selectionIndex
        })
        {
            label
        }
        .foregroundColor(selectionIndex == currentSelection ? Color("dark-green") : Color("red"))
    }
}

struct CustomTabBarView : View {
    @State var currentSelection : Int = 1
    
    var body : some View {
        let house = TabLabel(text: "หน้าแรก", imageName: "house.fill", color: Color("grey-icon"))
        let viewfinder = TabLabel(text: "", imageName: "viewfinder", color: Color("grey-icon"))
        let person = TabLabel(text: "โปรไฟล์", imageName: "person.fill", color: Color("grey-icon"))
        
        let button1 = TabButton(currentSelection: $currentSelection, selectionIndex: 1, label: house)
        let button2 = TabButton(currentSelection: $currentSelection, selectionIndex: 2, label: viewfinder)
        let button3 = TabButton(currentSelection: $currentSelection, selectionIndex: 3, label: person)
        
        
        return VStack() {
            
            Spacer()
            
            if currentSelection == 1 {
                HomeView()
            }
            else if currentSelection == 2 {
                ScanningView()
            }
            else if currentSelection == 3 {
                ProfileView()
            }
            
            Spacer()
            
            HStack() {
                button1
                Spacer()
                button2
                Spacer()
                button3
                
            }
            .padding(.horizontal, 62)
            .padding(.top, 20)
            .frame(height: 60)
            .background(Color("grey-light"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
