//
//  HotelViewModel.swift
//  Hotel
//
//  Created by Тагай Абдылдаев on 2023/12/17.
//

import Foundation

protocol HotelViewModelType: ObservableObject {
    
    var hotel: Hotel? { get }
    var details: [Detail] { get }
    func getHotelData()
    func pushRoomsView()
}

class HotelViewModel: HotelViewModelType {
        
    @Published var hotel: Hotel?
    
    var details = [Detail(id: 1, image: "emoji-happy", type: "Удобства", additionalInfo: "Самое необходимое"),
                           Detail(id: 2, image: "tick-square", type: "Что включено", additionalInfo: "Самое необходимое"),
                           Detail(id: 3, image: "close-square", type: "Что не включено", additionalInfo: "Самое необходимое")]
    
    private var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func getHotelData() {
        NetworkService.shared.getHotelData {[weak self] hotel, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let hotel = hotel {
                DispatchQueue.main.async {
                    self?.hotel = hotel
                }
            }
        }
    }
    
    func pushRoomsView() {
        coordinator.push(.room)
    }
}
