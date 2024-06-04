//
//  AnimatedCarouselSwiftUIApp.swift
//  AnimatedCarouselSwiftUI
//
//  Created by KARMANI Aziza on 24/08/2023.
//

import SwiftUI

@main
struct AnimatedCarouselSwiftUIApp: App {
    @StateObject  var imagesViewModel  = ImagesViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(imagesViewModel)
        }
    }
}


