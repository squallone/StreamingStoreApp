//
//  Color.swift
//  StreamingStoreApp
//
//  Created by Abdiel Soto on 07/11/24.
//

import Foundation
import SwiftUI

enum CustomColor {
    static var yellow: Color {
        Color(hex: "F7B84B")
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xff) / 255,
                  green: Double((hex >> 08) & 0xff) / 255,
                  blue: Double((hex >> 00) & 0xff) / 255,
                  opacity: opacity
        )
    }
    
    init(hex string: String, opacity: Double = 1) {
        
        let hex = string.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        self.init(hex: Int(int), opacity: opacity)
    }
}
