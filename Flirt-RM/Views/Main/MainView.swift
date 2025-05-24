import SwiftUI

struct MainView: View {
    @State private var selectedTab: BottomTabBar.Tab = .home

    var body: some View {
        VStack(spacing: 0) {
            // 🔝 Tüm sayfalarda gözükecek üst bar
            TopNavigationBar()
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .background(Color.black)

            // 📄 Sayfa içeriği (Değişken)
            Group {
                switch selectedTab {
                case .home:
                    DashboardView()
                case .chats:
                    Text("Chats View (Coming Soon)")
                case .inbox:
                    Text("Inbox View (Coming Soon)")
                case .profile:
                    Text("Profile View (Coming Soon)")
                }
            }

            // 🔻 Alt navigasyon
            BottomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard)
    }
}

