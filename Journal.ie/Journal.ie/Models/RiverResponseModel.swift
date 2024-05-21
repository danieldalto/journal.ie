//
//  RiverResponse.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import Foundation

struct RiverResponseContentModel: Decodable {
    let articles: ArticleRiver
}

/// Model representing the API response for any river endpoint
struct RiverResponseModel: Decodable {
    let rendered: Int
    let status: Bool
    let response: RiverResponseContentModel
}
