//
//  PaymentViewModel.swift
//  Hotel
//
//  Created by Тагай Абдылдаев on 2023/12/19.
//

import Foundation

protocol PaymentViewModelType: ObservableObject {
    
    var paymentNumber: Int { get }
    
    func pop()
    
    func popToHotelView()
}

class PaymentViewModel: PaymentViewModelType {
    
    private var coordinator: Coordinator
    
    var paymentNumber = Int.random(in: 1..<100)
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func pop() {
        coordinator.pop()
    }
    
    func popToHotelView() {
        coordinator.popToRoot()
    }
}
