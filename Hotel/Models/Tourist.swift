//
//  Client.swift
//  Hotel
//
//  Created by Тагай Абдылдаев on 2023/12/19.
//

import Foundation

struct Tourist: Identifiable {
    var id: Int
    var name: String = "Иван"
    var surname: String = "Иванов"
    var dateOfBirth: String = ""
    var citizenship: String = ""
    var passportNumber: String = ""
    var passportExpireDate: String = ""
}
