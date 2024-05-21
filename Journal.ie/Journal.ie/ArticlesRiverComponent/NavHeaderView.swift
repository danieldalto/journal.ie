//
//  NavHeaderView.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import SwiftUI

/// Component to show a custom navigation bar
struct NavHeaderView: View {
    @EnvironmentObject var router: Router
    @Environment(\.colorScheme) var colorScheme
    
    let title: String
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Text(title)
                .font(.title).bold()
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                //.background(.pink)
                .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
            if router.navPath.count > 0 {
                Button(action: { router.navigateBack() },
                       label: {
                            Image(systemName: "arrow.backward")
                        .font(.title2)
                        .frame(height: 60)
                        })
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                .frame(height: 60)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height:60)
        .foregroundColor(colorScheme == .dark ? .purple : .blue)
    }
}

#Preview {
    NavHeaderView(title: "The Journal Large Title").environmentObject(Router())
}
