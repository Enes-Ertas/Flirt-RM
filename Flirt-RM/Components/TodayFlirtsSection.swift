//
//  TodayFlirtsSection.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 24.05.2025.
//

import SwiftUI

struct TodayFlirtsSection: View {
    let flirts: [Flirt]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Flirts")
                .font(.system(size: 20, weight: .light))
                .padding(.horizontal, 4)
                .foregroundColor(.gray)

            VStack(spacing: 16) {
                ForEach(flirts) { flirt in
                    FlirtCardView(
                        name: flirt.name,
                        summary: flirt.gptProfile,
                        lastContact: flirt.lastContact.formatted(date: .abbreviated, time: .shortened)
                    )
                }
            }
        }
        .padding(.horizontal, 20)
    }
}
