//
//  RoomsViewModel.swift
//  Hotel
//
//  Created by Тагай Абдылдаев on 2023/12/18.
//

import SwiftUI

protocol RoomsViewModelType: ObservableObject {
    
    var rooms: [Room]? { get }
    func getRoomsData()
    func pop()
    func pushToBookingView()
}

class RoomsViewModel: RoomsViewModelType {
    
    @Published var rooms: [Room]?
        
    private var coordinator: Coordinator

    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func getRoomsData() {
        NetworkService.shared.getRoomsData { [weak self] roomsModel, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let roomsModel = roomsModel{
                DispatchQueue.main.async {
                    self?.rooms = roomsModel.rooms
                }
            }
        }
    }
    
    func pop() {
        coordinator.pop()
    }
    
    func pushToBookingView() {
        coordinator.push(.booking)
    }
}
