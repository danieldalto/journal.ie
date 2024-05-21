//
//  Router.swift
//  Journal.ie
//
//  Created by Daniel Dalto on 21/05/2024.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case article(id: Int)
        case river(endpoint: Endpoint)
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        guard navPath.count > 0 else { return }
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
