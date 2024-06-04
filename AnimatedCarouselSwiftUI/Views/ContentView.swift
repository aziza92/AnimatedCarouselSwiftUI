//
//  ContentView.swift
//  AnimatedCarouselSwiftUI
//
//  Created by KARMANI Aziza on 24/08/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                AccountView()
            case .notifications:
                NotificationsView()
            case .setting:
                Setting()
            }
           TabBar()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ImagesViewModel())
    }
}
