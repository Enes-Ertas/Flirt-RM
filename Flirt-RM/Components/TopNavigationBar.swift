// TopNavigationBar.swift
import SwiftUI

struct TopNavigationBar: View {
    @Binding var isAddingFlirt: Bool
    @Binding var isMenuOpen: Bool

    var body: some View {
        HStack {
            // — Sidebar Leading Icon —
            Button {
                withAnimation(.easeInOut) { isMenuOpen.toggle() }
            } label: {
                Image(systemName: "sidebar.leading")
                    .font(.system(size: 24))
                    .foregroundColor(.gray)
            }

            Spacer()

            Text("FlirtMate")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.gray)

            Spacer()

            // — “+” to Add New Flirt —
            Button {
                isAddingFlirt = true
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 8)
        .frame(height: 56)
        .background(Color.black)
    }
}
