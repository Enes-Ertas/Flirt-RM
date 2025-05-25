// SideMenuView.swift
import SwiftUI

struct SideMenuView: View {
    @Binding var isOpen: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Menu")
                .font(.title2).bold()
                .foregroundColor(.white)
                .padding(.top, 40)

            Button("Home") {
                withAnimation { isOpen = false }
            }
            .foregroundColor(.white)

            Button("Settings") {
                withAnimation { isOpen = false }
            }
            .foregroundColor(.white)

            Button("Help") {
                withAnimation { isOpen = false }
            }
            .foregroundColor(.white)

            Divider()
                .background(Color.white.opacity(0.3))
                .padding(.vertical, 8)

            Button("Log out", role: .destructive) {
                withAnimation { isOpen = false }
            }
            .foregroundColor(.white)

            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: 240, maxHeight: .infinity)
        .background(Color.black)
        .clipShape(RoundedCorner(radius: 20, corners: [.topRight, .bottomRight]))
        .shadow(radius: 4)
    }
}
