//
//  TagsView.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import SwiftUI

/// Component to show a list of tags
struct TagsView: View {
    let tags: [Endpoint]
    let action: (Endpoint)->Void
    
    func item(for e: Endpoint) -> some View {
        Button {
            action(e)
        } label: {
            Text(e.title!)
                .font(.caption)
                .bold()
                .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
        }.background(e.isPublication ? .purple : .blue)
            .foregroundColor(.white)
            .cornerRadius(5)
    }
    
    var body: some View {
        // TODO: make it wrap when the ammount of tags doesn't fit
        HStack {
            ForEach(tags) { e in
                item(for: e)
            }
        }.padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
    }
}

#Preview {
    TagsView(tags: exampleRiverEndpoints) { _ in }
}
