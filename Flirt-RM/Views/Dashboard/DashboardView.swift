import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {

                // 🧩 Scrollable içerik, gri kartlı container içinde
                DashboardContainerView {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16) {
                                StatCardView(title: "New Profiles", value: "7")
                                StatCardView(title: "Recent Chats", value: "16")
                                StatCardView(title: "AI Summaries", value: "3")
                                StatCardView(title: "New Flirt", value: "1")
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 32)
                            
                            TodayFlirtsSection(flirts: [
                                Flirt(name: "Ayşe", gptProfile: "Introverted, kind, loves literature.", lastContact: Date()),
                                Flirt(name: "Berk", gptProfile: "Analytical, passionate about politics and strong coffee.", lastContact: Date().addingTimeInterval(-3600))
                            ])
                        }
                        .padding(.bottom, 60)
                    }
                }
            }
        }
    }
}
