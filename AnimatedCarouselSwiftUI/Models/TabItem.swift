//
//  TabItem.swift
//  AnimatedCarouselSwiftUI
//
//  Created by KARMANI Aziza on 25/08/2023.
//

import Foundation
import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selection: Tab
}

var tabItems = [
    TabItem(name: "Home", icon: "house", color: .teal, selection: .home),
    TabItem(name: "Explore", icon: "magnifyingglass", color: .blue, selection: .explore),
    TabItem(name: "Notifications", icon: "bell", color: .red, selection: .notifications),
    TabItem(name: "Setting", icon: "gear", color: .pink, selection: .setting),
]

enum Tab: String {
    case home
    case explore
    case notifications
    case setting
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
