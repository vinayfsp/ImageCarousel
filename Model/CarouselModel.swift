//
//  CarouselModel.swift
//  ImageCarousel
//
//  Created by Vinay Pampana on 09/08/24.
//

import Foundation


struct ImageItem: Identifiable {
    let id = UUID()
    let name: String
    let category: String
}

// Function to generate dynamic image data
func generateSampleImages(categories: [String], imagesPerCategory: Int) -> [ImageItem] {
    var items: [ImageItem] = []
    for category in categories {
        for i in 1...imagesPerCategory {
            let imageName = "\(category.lowercased())\(i)"
            items.append(ImageItem(name: imageName, category: category))
        }
    }
    
    return items
}
