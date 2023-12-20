//
//  HotelBasicInfoView.swift
//  Hotel
//
//  Created by Тагай Абдылдаев on 2023/12/17.
//

import SwiftUI

struct HotelBasicInfoView: View {
    
    let hotelName = "Steigenberger Makadi"
    let hotelAdress: String
    let hotelRating: Int
    let hotelRatingName: String
    
    init(hotel: Hotel?) {
        self.hotelAdress = hotel?.adress ?? ""
        self.hotelRating = hotel?.rating ?? 0
        self.hotelRatingName = hotel?.ratingName ?? ""
    }
    
    init(hotelAdress: String?, hotelRating: Int?, hotelRatingName: String?) {
        self.hotelAdress = hotelAdress ?? ""
        self.hotelRating = hotelRating ?? 0
        self.hotelRatingName = hotelRatingName ?? ""
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(spacing: 2) {
                
                Image("star")
                    .resizable()
                    .frame(width: 15, height: 15)
                
                Text("\(hotelRating) \(hotelRatingName)")
                    .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                    .foregroundStyle(Color.textOrange)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.yellowBackground)
            .cornerRadius(5)
            
            Text(hotelName)
                .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
            
            Text(hotelAdress)
                .font(Font.custom("SF Pro Display", size: 14).weight(.medium))
                .foregroundStyle(Color.buttonBlue)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
