//
//  TagsView.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import SwiftUI

struct TagsView: View {
    let tags: [Endpoint]
    let action: (Endpoint)->Void
    var body: some View {
        HStack {
            ForEach(tags) { e in
                Button {
                    action(e)
                } label: {
                    Text(e.title!)
                        .font(.caption)
                        .bold()
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                }.background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
        }.padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
    }
}

#Preview {
    TagsView(tags: exampleEndpointTags) { _ in }
}
