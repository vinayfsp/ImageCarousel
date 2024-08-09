//
//  CarouselViewModel.swift
//  ImageCarousel
//
//  Created by Vinay Pampana on 09/08/24.
//

import Foundation
import SwiftUI
import Combine

class ImageCarouselViewModel: ObservableObject {
    @Published var currentIndex: Int = 0
    @Published var searchTerm: String = ""
    @Published var images: [ImageItem] = []
    
    let categoryImages: [String: String] = [
        "Cars": "car_default",
        "Animals": "animal_default",
        "Nature": "nature_default"
    ]
    
    var categories: [String] {
        Array(Set(images.map { $0.category })).sorted()
    }
    
    var currentCategory: String {
        categories[currentIndex]
    }
    
    var filteredItems: [ImageItem] {
        images.filter { item in
            item.category == currentCategory &&
            (searchTerm.isEmpty || item.name.localizedCaseInsensitiveContains(searchTerm))
        }
    }
    
    init() {
        let categories = ["Cars", "Animals", "Nature"]
        images = generateSampleImages(categories: categories, imagesPerCategory: 10)
    }
}
