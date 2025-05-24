//
//  StatCardView.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 24.05.2025.
//

// StatCardView.swift

import SwiftUI

struct StatCardView: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 8) {
            Text(value)
                .font(.system(size: 36, weight: .semibold))
                .foregroundColor(.black)

            Text(title)
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.black)
        }
        .frame(width: 150, height: 120)
        .background(Color.white) // Hex: #e4cef2
        .cornerRadius(12)
    }
}
