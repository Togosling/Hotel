//
//  CoordinatorView.swift
//  Hotel
//
//  Created by Тагай Абдылдаев on 2023/12/18.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        
        NavigationStack(path: $coordinator.path) {
            
            coordinator.build(.hotel)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page)
                }
        }
    }
}
