//
//  Endpoint.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import Foundation

// climate-change, housing, ep2024, google
var exampleEndpointTags = [ Endpoint.tag(name: "Climate Change", slug: "climate-change"),
                            Endpoint.tag(name: "Housing", slug: "housing"),
                            Endpoint.tag(name: "EP 2024", slug: "ep2024")]

var initialRiverEndpoint = Endpoint.publication(name: "The Journal", slug: "thejournal")

enum Endpoint: Codable,Equatable,Hashable {
    
    case publication(name: String, slug: String) // valid params: thejournal, thescore
    case tag(name: String, slug: String) // valid params: climate-change, housing, ep2024, google
    
    var isRiverEndpoint: Bool {
        switch self {
        case .publication(_,_):
            return true
        case .tag(_,_):
            return true
        }
    }
    
    var title: String? {
        switch self {
        case .publication(let name,_):
            return name
        case .tag(let name,_):
            return name
        }
    }
    
    func path() -> String {
        switch self {
        case .publication(_, let slug):
            return "sample/"+slug
        case .tag(_, let slug):
            return "sample/tag/"+slug
        }
    }
}

extension Endpoint: Identifiable {
    var id: String {
        return path()
    }
}
