// MainView.swift
import SwiftUI

struct MainView: View {
    @State private var selectedTab: BottomTabBar.Tab = .home
    @State private var isMenuOpen = false
    @State private var isAddingFlirt = false

    var body: some View {
        ZStack(alignment: .leading) {
            // — Underlying content —
            VStack(spacing: 0) {
                TopNavigationBar(isAddingFlirt: $isAddingFlirt, isMenuOpen: $isMenuOpen)

                Group {
                    switch selectedTab {
                    case .home:    DashboardView()
                    case .calendar:   Text("Calendar View (Coming Soon)")
                    case .inbox:   Text("Inbox View (Coming Soon)")
                    case .profile: Text("Profile View (Coming Soon)")
                    }
                }
                .ignoresSafeArea(.keyboard)

                BottomTabBar(selectedTab: $selectedTab)
            }
            .disabled(isMenuOpen) // Menüyü açınca arkayı dokunulmaz yap

            // — Semi-transparent backdrop —
            if isMenuOpen {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation { isMenuOpen = false }
                    }
            }

            // — The actual drawer —
            if isMenuOpen {
                SideMenuView(isOpen: $isMenuOpen)
                    .transition(.move(edge: .leading))
            }

            // — Navigation to AddFlirtView —
            NavigationLink(
                destination: AddFlirtView(),
                isActive: $isAddingFlirt,
                label: EmptyView.init
            )
        }
        .animation(.easeInOut, value: isMenuOpen)
    }
}
