//
//  FloatingLabelTextField.swift
//  Hotel
//
//  Created by Тагай Абдылдаев on 2023/12/18.
//

import Foundation
import SwiftUI
import Combine

struct FloatingLabelTextField: View {
    
    var placeholder: String
    @Binding var text: String
    var keyboardtype: UIKeyboardType?
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Text(self.placeholder)
                .font(Font.custom("SF Pro Display", size: self.text.isEmpty ? 17: 12))
                .foregroundColor(Color.textGray)
                .offset(x: 0, y: self.text.isEmpty ? 0 : -16)
                .scaleEffect(self.text.isEmpty ? 1 : 0.8, anchor: .topLeading)
            
            TextField("", text: self.$text)
                .keyboardType(keyboardtype != nil ? keyboardtype! : .default)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }
}
