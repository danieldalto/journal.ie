//
//  ArticleModel.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import Foundation

typealias ArticleRiver = [ArticleModel]

/// Model representing the API Article.
struct ArticleModel: Decodable, Identifiable {
    static func == (lhs: ArticleModel, rhs: ArticleModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    let title: String
    let images: [String:ImageInfoModel]
    let type: String
    
    var thumbnailImageURL: URL? {
        return images["thumbnail"]?.imageURL
    }
}
