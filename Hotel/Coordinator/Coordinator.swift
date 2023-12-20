//
//  Coordinator.swift
//  Hotel
//
//  Created by Тагай Абдылдаев on 2023/12/18.
//

import SwiftUI

enum Page: String, Identifiable {
    case hotel, room, booking, payment
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder func build(_ page: Page) -> some View {
        switch page {
        case .hotel:
            HotelView(viewModel: HotelViewModel(coordinator: self))
        case .room:
            RoomsView(viewModel: RoomsViewModel(coordinator: self))
        case .booking:
            BookingView(viewModel: BookingViewModel(coordinator: self))
        case .payment:
            PaymentView(viewModel: PaymentViewModel(coordinator: self))
        }
    }
}
