//
//  Extensions.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 24.05.2025.
//

import SwiftUI

extension Color {
    static func fromHex(_ hex: String) -> Color {
        var hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b: Double
        if hex.count == 6 {
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
        } else {
            r = 0; g = 0; b = 0
        }

        return Color(red: r, green: g, blue: b)
    }
}
