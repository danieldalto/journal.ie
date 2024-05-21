//
//  ArticleView.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import SwiftUI

/// Simple Article View to be able to push something on river tap
struct ArticleView: View {
    let articleId: Int
    
    var body: some View {
        VStack(spacing: 20) {
            NavHeaderView(title: "The Journal Article")
            ScrollView() {
                VStack(spacing: 20) {
                    Text("ArticleID: \(articleId)").font(.title).bold()
                    Text("TBD: Create a component to render articles.")
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ArticleView(articleId: 1234).environmentObject(Router())
}
