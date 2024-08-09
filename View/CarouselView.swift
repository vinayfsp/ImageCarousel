//
//  CarouselView.swift
//  ImageCarousel
//
//  Created by Vinay Pampana on 09/08/24.
//

import SwiftUI

struct CarouselView: View {
    @ObservedObject var viewModel = ImageCarouselViewModel()
    
    var body: some View {
        VStack {
            // Image Carousel with default images based on the category
            TabView(selection: $viewModel.currentIndex) {
                ForEach(viewModel.categories.indices, id: \.self) { index in
                
                    Image(viewModel.categoryImages[viewModel.categories[index], default: "placeholder"])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 380, height: 200)
                        .cornerRadius(20)
                        .clipped()
                        .tag(index)
                        .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)

            //Page Indicator
            HStack {
                ForEach(0..<viewModel.categories.count) { index in
                    Circle()
                        .fill(viewModel.currentIndex == index ? Color.gray : Color.white)
                        .frame(width: 10, height: 10)
                        .onTapGesture {
                            viewModel.currentIndex = index
                        }
                        .background(
                            Circle()
                                .fill()
                                .frame(width: 14, height: 14)
                                .opacity(0.2)
                        )
                }
            }
            .animation(.easeInOut, value: viewModel.currentIndex)
            .padding(.top, 8)

            // Search Bar using a Textfield input
            TextField("Search Images", text: $viewModel.searchTerm)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(width: 390)

            // Items to be listed in List View
            ScrollView {
                VStack {
                    ForEach(viewModel.filteredItems) { item in
                        HStack {
                            Image(item.name)
                                .resizable()
                                .cornerRadius(14)
                                .frame(width: 40, height: 40)
                                .aspectRatio(contentMode: .fill)
                            Text(item.name)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
