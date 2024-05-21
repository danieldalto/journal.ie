//
//  ArticleCell.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import SwiftUI

/// Component to show an article post cell
struct ArticleCell: View {
    @Environment(\.colorScheme) var colorScheme
    let article: ArticleModel
    private let imageWidth: CGFloat = 100
    
    var imageNotLoaded: some View {
        ZStack(alignment: Alignment(horizontal: .center, 
                                    vertical: .center)) {
            Image(systemName: "photo")
                .foregroundColor(Color(white: 0.5))
                .font(.title)
        }.frame(width: imageWidth, height: imageWidth)
    }
    
    var imagePlaceholder: some View {
        // Acts as a placeholder.
        ZStack(alignment: Alignment(horizontal: .center, 
                                    vertical: .center)) {
            ProgressView()
        }.frame(width: imageWidth, height: imageWidth)
    }
    
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing:10) {
                if let imageURL = article.thumbnailImageURL {
                    AsyncImage(url: imageURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                        } else if phase.error != nil {
                            imageNotLoaded
                        } else {
                            imagePlaceholder
                        }
                    }
                    .background(colorScheme == .dark ? Color(white: 0.1) : Color(white: 0.9))
                    
                    .frame(width: imageWidth, height: imageWidth)
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(10)
                } else {
                    imageNotLoaded
                }
                Text(article.title)
                    .font(.headline)
                    .frame(width: proxy.size.width-imageWidth-10, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .frame(maxHeight: imageWidth)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: imageWidth)
        .foregroundColor(colorScheme == .dark ? .white : .black)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 20))
    }
}

#Preview {
    //
    ArticleCell(article: ArticleModel(id: 0, title: "Test Article Test Article Test Article Test Article Test Article Test Article Test Article Test Article Test Article Test Article Test Article Test Article", images: ["thumbnail":ImageInfoModel(image: "https://images.unsplash.com/photo-1605723517503-3cadb5818a0c")], type: "post"))
}
