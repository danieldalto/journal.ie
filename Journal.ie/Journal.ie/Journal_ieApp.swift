//
//  Journal_ieApp.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import SwiftUI

@main
struct Journal_ieApp: App {
    @ObservedObject var router = Router()
    private var composer = Composer()
    
    var body: some Scene {
        WindowGroup {
            // centralized navigation
            NavigationStack(path: $router.navPath) {
                composer.riverView(for: initialRiverEndpoint)
                .navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .article(let id):
                        composer.articleView(id: id)
                    case .river(let endpoint):
                        composer.riverView(for: endpoint)
                    }
                }
            }
            .environmentObject(router)
        }
    }
}
