import SwiftUI

struct ContentView: View {
    var flirts = sampleFlirts

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(flirts) { flirt in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(flirt.name)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                            HStack(spacing: 6) {
                                Image(systemName: "calendar")
                                    .foregroundColor(.secondary)
                                Text(flirt.lastContact.formatted(date: .abbreviated, time: .omitted))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }

                            HStack(alignment: .top, spacing: 6) {
                                Image(systemName: "bubble.left")
                                    .foregroundColor(.blue)
                                Text(NSLocalizedString(flirt.gptProfileKey, comment: ""))
                                    .font(.body)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemGray6)))
                        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Flörtlerim")
        }
    }
}
