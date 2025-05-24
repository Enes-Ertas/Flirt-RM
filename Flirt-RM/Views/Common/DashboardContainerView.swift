//
//  DashboardContainerView.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 24.05.2025.
//

import SwiftUI

struct DashboardContainerView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            content
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.black)) // 🩶 Arkaplan: gri
        .cornerRadius(40) // Uizard “top: 64px”
    }
}
