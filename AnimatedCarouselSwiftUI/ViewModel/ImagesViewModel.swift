//
//  ImagesViewModel.swift
//  AnimatedCarouselSwiftUI
//
//  Created by KARMANI Aziza on 24/08/2023.
//

import Foundation


class ImagesViewModel: ObservableObject {
    @Published private(set) var images: [Images] = []
    
    init() {
        images = Images.all
    }

}
