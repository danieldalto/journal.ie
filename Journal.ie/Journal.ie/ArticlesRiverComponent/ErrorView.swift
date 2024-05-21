//
//  ErrorView.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    let refreshAction: ()->Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20 ) {
            Text("Something went wrong")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("The content you requested either failed to load or is unavailable. Tap \"Try Again\" to reload this content.")
            Text(error.localizedDescription).font(.caption)
            Button(action: {
                refreshAction()
            }, label: {
                Text("Try Again")
            })
        }.padding(20)
    }
}

#Preview {
    ErrorView(error: URLError(.badURL), refreshAction: {})
}
