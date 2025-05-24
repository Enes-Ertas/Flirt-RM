//
//  WelcomeStatsView.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 24.05.2025.
//
import SwiftUI

struct WelcomeStatsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Welcome to FlirtMate!")
                .font(.system(size: 28))
                .fontWeight(.light)
                .foregroundColor(.black)

            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16) {
                StatCard(value: "7", label: "New Profiles")
                StatCard(value: "16", label: "Recent Chats")
                StatCard(value: "3", label: "AI Summaries")
                StatCard(value: "1", label: "New Flirt")
            }
        }
        .padding(.horizontal, 20)
    }
}
