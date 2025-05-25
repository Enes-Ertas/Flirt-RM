// BottomTabBar.swift
// Flirt-RM

import SwiftUI

struct BottomTabBar: View {
    @Binding var selectedTab: Tab

    enum Tab {
        case home, calendar, inbox, profile
    }

    var body: some View {
        HStack(spacing: 40) {
            tabButton(icon: "house", tab: .home)
            // Chat sekmesinin yerine takvim ikonu kullanılıyor
            tabButton(icon: "calendar", tab: .calendar)
            tabButton(icon: "tray.full", tab: .inbox)
            tabButton(icon: "person.crop.circle", tab: .profile)
        }
        .padding()
        .background(Color.black.shadow(radius: 4))
    }

    private func tabButton(icon: String, tab: Tab) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(selectedTab == tab ? .purple : .gray)
        }
    }
}
