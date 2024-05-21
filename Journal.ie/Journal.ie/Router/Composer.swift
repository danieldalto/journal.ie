//
//  Composer.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import Foundation
import SwiftUI

/// Composer to create components using dependency injection
class Composer {
    let api = JournalAPI()
    
    func riverView(for e: Endpoint) -> some View {
        let vm = ArticlesRiverViewModel(api: api, endpoint: e)
        return ArticlesRiverView(vm: vm)
    }
    
    func articleView(id: Int) -> some View {
        ArticleView(articleId: id)
    }
}
