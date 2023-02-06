//
//  CustomTabbar.swift
//  doorian
//
//  Created by Warunya on 6/2/2566 BE.
//

import SwiftUI

//enum Tabs: Int {
//    case home = 0
//    case scanning = 1
//    case profile = 2
//}
var tabs = ["house.fill", "viewfinder", "person.fill"]
var nameTabs = ["หน้าแรก", "", "โปรไฟล์"]

struct TabButton: View {
    var image: String
    
    @Binding var selectedTab : String
    
    var body: some View {
        Button(action: {selectedTab = image}) {
            ZStack {
                if image == "viewfinder"   {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("red-button"))
                }
                VStack {
                    Image(systemName: image)
                        .frame(width: 30, height: 30)
                        .foregroundColor(
                            selectedTab == image ? Color("dark-green") : Color("grey-icon")
                        )
                    
//                    if image == "house.fill" {
//                        Text("หน้าแรก")
//                            .font(.system(size: 10))
//                            .foregroundColor(Color("grey-icon"))
//                    } else if image == "person.fill" {
//                        Text("โปรไฟล์")
//                            .font(.system(size: 10))
//                    }
                }
            }
        }
    }
}

struct CustomTabbar: View {
    @State var selectedTab = "house.fill"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag("house.fill")
                ScanningView()
                    .tag("viewfinder")
                ProfileView()
                    .tag("person.fill")
            }
            
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { image in
                    
                    TabButton(image: image, selectedTab: $selectedTab)
                    
                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 62)
            .padding(.vertical, 10)
            .background(Color("FCFCFC"))
        }
    }
}

struct CustomTabbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabbar()
    }
}
