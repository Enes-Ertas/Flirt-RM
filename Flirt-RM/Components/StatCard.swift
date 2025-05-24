//
//  StatCard.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 24.05.2025.
//

import SwiftUI

struct StatCard: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 8) {
            Text(value)
                .font(.system(size: 40))
                .fontWeight(.medium)
                .foregroundColor(.black)

            Text(label)
                .font(.system(size: 14))
                .foregroundColor(.black.opacity(0.7))
        }
        .frame(width: 155, height: 130)
        .background(Color.fromHex("#e4cef2"))
        .cornerRadius(12)
    }
}
