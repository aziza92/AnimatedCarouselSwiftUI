//
//  ImageModel.swift
//  AnimatedCarouselSwiftUI
//
//  Created by KARMANI Aziza on 24/08/2023.
//

import Foundation


struct Images : Identifiable{
    let id: Int
    let name: String
    let image: String

}

extension Images {
    static let all: [Images] = [
        Images(id: 0, name: "image1", image: "https://images.pexels.com/photos/12181246/pexels-photo-12181246.jpeg"),
        Images(id: 1, name: "image2", image: "https://images.pexels.com/photos/16844072/pexels-photo-16844072/free-photo-of-femme-marcher-fleurs-arbres.jpeg"),
        Images(id: 2, name: "image3", image: "https://images.pexels.com/photos/17688838/pexels-photo-17688838/free-photo-of-clairiere-ete-jardin-herbe.jpeg"),
        Images(id: 3, name: "image4", image: "https://images.pexels.com/photos/16564864/pexels-photo-16564864/free-photo-of-clairiere-ete-jardin-herbe.jpeg")
    ]
}

