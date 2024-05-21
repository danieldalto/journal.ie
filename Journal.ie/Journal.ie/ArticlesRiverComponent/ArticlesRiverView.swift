//
//  ArticlesRiverView.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import SwiftUI

/// View Model Protocol to feed information from article rivers
protocol ArticlesRiverViewModelProtocol: ObservableObject {
    var articles: ArticleRiver { get }
    var error: Error? { get }
    var title: String? { get }
    var tags: [Endpoint] { get }
    
    func refreshData()
    func asyncRefreshData() async
}

/// View representation for Rivers
struct ArticlesRiverView<ViewModel>: View where ViewModel: ArticlesRiverViewModelProtocol {
    @EnvironmentObject var router: Router
    @StateObject var vm: ViewModel
    
    var body: some View {
        VStack {
            NavHeaderView(title: vm.title ?? "")
            TagsView(tags: vm.tags) { e in
                router.navigate(to: .river(endpoint: e))
            }
            ScrollView {
                if let error = vm.error {
                    ErrorView(error: error) {
                        vm.refreshData()
                    }
                } else if vm.articles.count > 0 {
                    LazyVStack(alignment:.leading) {
                        ForEach(vm.articles) { article in
                            Button {
                                router.navigate(to: .article(id: article.id))
                            } label: {
                                ArticleCell(article: article)
                            }
                        }
                    }
                } else {
                    // Loading - Empty list
                    ProgressView()
                }
            }
        }
        .onAppear() {
            vm.refreshData()
        }
        .navigationBarHidden(true)
        .refreshable {
            await vm.asyncRefreshData()
        }
    }
}

#Preview {
    ArticlesRiverView(vm: ArticlesRiverViewModel(api: JournalAPI(),
                                                 endpoint: initialRiverEndpoint)).environmentObject(Router())
}
