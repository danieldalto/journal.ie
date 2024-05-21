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
    let api = JournalAPI()
    
    func riverView(for e: Endpoint) -> some View {
        let vm = ArticlesRiverViewModel(api: api, endpoint: e)
        return ArticlesRiverView(vm: vm)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                self.riverView(for: initialRiverEndpoint)
                .navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .article(let id):
                        ArticleView(articleId: id)
                    case .river(let endpoint):
                        self.riverView(for: endpoint)
                    }
                }
            }
            .environmentObject(router)
        }
    }
}
