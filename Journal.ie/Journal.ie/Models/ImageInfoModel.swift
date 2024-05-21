//
//  ImageInfoModel.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import Foundation

/// Model representing an image inside any API article
struct ImageInfoModel: Decodable {
    let image: String
    
    var imageURL: URL? {
        return URL(string: image)
    }
}
