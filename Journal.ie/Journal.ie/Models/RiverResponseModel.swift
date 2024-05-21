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

struct RiverResponseModel: Decodable {
    let rendered: Int
    let status: Bool
    let response: RiverResponseContentModel
}
