//
//  JournalAPI.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import Foundation
import Combine


/// Implementation of the Journal API
class JournalAPI {
    static private let BASE_URL = "https://api.thejournal.ie/v3/"
    static private let BASIC_AUTH = "codetest:AQJl5jewY2lZkrJpiT1cCJkj1tLPn64R"
    
    private var session: URLSession
    private let decoder: JSONDecoder
    
    init() {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        //decoder.dateDecodingStrategy = .iso8601
        
        session = URLSession(configuration: Self.makeSessionConfiguration())
    }
    
    static private func makeSessionConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        
        let passwordData = Self.BASIC_AUTH.data(using:String.Encoding.utf8)!
        let base64EncodedCredential = passwordData.base64EncodedString()
        let authString = "Basic \(base64EncodedCredential)"
        
        let headers = [
            "Authorization" : authString,
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
        configuration.httpAdditionalHeaders = headers
        
        configuration.urlCache = .shared
        configuration.requestCachePolicy = .reloadRevalidatingCacheData
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        
        return configuration
    }
    
    private func fetchRiver(path: String) async throws -> ArticleRiver {
        let url = URL(string: Self.BASE_URL+path)!
        let (data, response) = try await session.data(from: url)
        
        // Check status of 2XX
        guard let response = response as? HTTPURLResponse,(200...299).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let riverResponse = try decoder.decode(RiverResponseModel.self, from: data)
        let river = riverResponse.response.articles
        return river
    }
}

extension JournalAPI: JournalAPIProtocol {
    func fetchArticlesRiver(endpoint: Endpoint) async throws -> ArticleRiver {
        guard endpoint.isRiver else { throw URLError(.badURL) }
        return try await fetchRiver(path: endpoint.path())
    }
}
