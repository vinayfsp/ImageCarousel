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
