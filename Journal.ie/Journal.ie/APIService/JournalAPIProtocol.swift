//
//  JournalAPIProtocol.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import Foundation
import Combine

protocol JournalAPIProtocol {
    func fetchArticlesRiver(endpoint: Endpoint) async throws -> ArticleRiver
}
