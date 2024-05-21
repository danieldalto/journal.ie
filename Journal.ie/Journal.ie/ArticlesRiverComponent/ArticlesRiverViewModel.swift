//
//  ArticlesRiverViewModel.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import Foundation
import Combine

/// View Model to feed information from article rivers
class ArticlesRiverViewModel {
    private let api: JournalAPIProtocol
    private let endpoint: Endpoint
    
    @MainActor @Published var articles: ArticleRiver = []
    @MainActor @Published var error: Error?
    
    init(api: JournalAPIProtocol, endpoint: Endpoint) {
        self.api = api
        self.endpoint = endpoint
    }
    
    @MainActor
    private func updateArticles(_ art: ArticleRiver) {
        // Update it on main thread since it will update the UI
        self.articles = art
    }
    
    @MainActor
    private func updateError(_ error: Error?) {
        // Update it on main thread since it will update the UI
        self.error = error
    }
    
    private func clearAll() async {
        await self.updateArticles([])
        await self.updateError(nil)
    }
}

extension ArticlesRiverViewModel: ArticlesRiverViewModelProtocol {
    
    var title: String? {
        return endpoint.title
    }
    var tags: [Endpoint] {
        return exampleEndpointTags.filter({$0.id != endpoint.id})
    }
    
    func refreshData() {
        Task { [weak self] in
            await self?.asyncRefreshData()
        }
    }
    
    func asyncRefreshData() async {
        do {
            let art = try await self.api.fetchArticlesRiver(endpoint: endpoint)
            await self.updateArticles(art)
            await self.updateError(nil)
        } catch {
            await self.updateArticles([])
            await self.updateError(error)
        }
    }
}
