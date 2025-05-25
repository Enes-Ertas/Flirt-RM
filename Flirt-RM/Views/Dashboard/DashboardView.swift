import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // — İçerik container’ı —
                DashboardContainerView {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 20) {

                            // — Özel 2 satır grid —
                            VStack(spacing: 16) {

                                // 1. satır: [kare][dikdörtgen]
                                HStack(spacing: 16) {
                                    StatCardView(
                                        value: "7",
                                        subtitle: "New Profiles",
                                        isFlexible: false
                                    )
                                    StatCardView(
                                        value: "16",
                                        subtitle: "Recent Chats",
                                        isFlexible: true
                                    )
                                }
                                .frame(maxWidth: .infinity)
                                
                                // 2. satır: [dikdörtgen][kare]
                                HStack(spacing: 16) {
                                    StatCardView(
                                        value: "3",
                                        subtitle: "AI Summaries",
                                        isFlexible: true
                                    )
                                    StatCardView(
                                        value: "1",
                                        subtitle: "New Flirt",
                                        isFlexible: false
                                    )
                                }
                                .frame(maxWidth: .infinity)

                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 32)

                            // — Today's Flirts —
                            TodayFlirtsSection(flirts: [
                                Flirt(name: "Ayşe",
                                      gptProfile: "Introverted, kind, loves literature.",
                                      lastContact: Date()),
                                Flirt(name: "Berk",
                                      gptProfile: "Analytical, passionate about politics and strong coffee.",
                                      lastContact: Date().addingTimeInterval(-3600))
                            ])
                        

                        }
                        .padding(.bottom, 60)
                    }
                }
            }
        }
    }
}
