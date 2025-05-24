//
//  BottomTabBar.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 24.05.2025.
//

import SwiftUI

struct BottomTabBar: View {
    @Binding var selectedTab: Tab

    enum Tab {
        case home, chats, inbox, profile
    }

    var body: some View {
        HStack(spacing: 40) {
            tabButton(icon: "house", tab: .home)
            tabButton(icon: "bubble.left", tab: .chats)
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
