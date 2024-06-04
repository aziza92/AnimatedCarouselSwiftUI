//
//  TabBar.swift
//  AnimatedCarouselSwiftUI
//
//  Created by KARMANI Aziza on 24/08/2023.
//

import SwiftUI

struct TabBar: View {
    
    @State var color: Color = .teal
    @State var tabItemWidth: CGFloat = 0
    
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    var body: some View {
    
            HStack {
                buttons
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40, style: .continuous))
            
            .background(
                backgroundCircle
            )
            .overlay(
                overlayRectangle
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
 
    }
    
    var buttons: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation {
                    selectedTab = item.selection
                    color = item.color
                }
            } label: {
                VStack(spacing: 0){
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 45, height: 30)
                    Text(item.name)
                        .font(.caption2)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundColor(selectedTab == item.selection ? .primary : .secondary)
            .blendMode(selectedTab == item.selection ? .overlay : .normal)
            .overlay(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: TabPreferenceKey.self, value: proxy.size.width)
                })
            .onPreferenceChange(TabPreferenceKey.self){ value in
                tabItemWidth = value
            }
        }
    }
    
    var backgroundCircle: some View {
        
        HStack{
            if selectedTab == .setting {
                Spacer()
            }
            if selectedTab == .explore {
                Spacer()
            }
            if selectedTab ==  .notifications {
                Spacer()
                Spacer()
            }
            Circle().fill(color).frame(width: tabItemWidth )
            if selectedTab ==  .home { Spacer() }
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if selectedTab ==  .notifications { Spacer()}
        }
        .padding(.horizontal, 8)
    }
    
    var overlayRectangle: some View {
        
        HStack{
            if selectedTab == .setting {
                Spacer()
            }
            if selectedTab == .explore {
                Spacer()
            }
            if selectedTab ==  .notifications {
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(color)
                .frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            if selectedTab ==  .home { Spacer() }
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if selectedTab ==  .notifications { Spacer()}
        }
        .padding(.horizontal, 8)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
