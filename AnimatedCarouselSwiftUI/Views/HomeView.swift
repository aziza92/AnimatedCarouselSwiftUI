//
//  HomeView.swift
//  AnimatedCarouselSwiftUI
//
//  Created by KARMANI Aziza on 28/08/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var imageVM = ImagesViewModel()
    @State private var currentIndex : Int = 0
    @GestureState private var dragOffset : CGFloat = 0
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Images")
                    .font(.system(size: 35, design: .serif))
                    .padding(20)
                
                ZStack {
                    ForEach(imageVM.images.indices, id: \.self) { index in
                        if let imageUrl = URL(string: imageVM.images[index].image) {
                            AsyncImage(url: imageUrl) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(25)
                                    .frame(width: 290, height: 400)
                                    .opacity(currentIndex == index ? 1.0 : 0.5)
                                    .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                                    .offset(x: CGFloat(index - currentIndex) * 280 + dragOffset, y: 0)
                                   
                            }  placeholder: {
                                Color.gray
                                    .frame(width: 300, height: 400)
                                    .cornerRadius(25)
                            }
                        }
                    }
                }
                .gesture(DragGesture().onEnded({ value in
                    let threshold : CGFloat = 50
                    if value.translation.width > threshold {
                        withAnimation{
                            currentIndex = max(0, currentIndex - 1)
                        }
                    }else if value.translation.width < -threshold {
                        withAnimation{
                            currentIndex = min(imageVM.images.count - 1, currentIndex + 1)
                        }
                    }
                }))
            }
         
        }
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ImagesViewModel())
    }
}
