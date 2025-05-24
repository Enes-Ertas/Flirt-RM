import SwiftUI

struct FlirtDetailView: View {
    let flirt: Flirt

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Text(flirt.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                HStack(spacing: 8) {
                    Image(systemName: "calendar")
                        .foregroundColor(.secondary)
                    Text(flirt.lastContact.formatted(date: .abbreviated, time: .shortened))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "bubble.left")
                        .foregroundColor(.blue)
                    Text(NSLocalizedString(flirt.gptProfile, comment: ""))
                        .font(.body)
                        .foregroundColor(.primary)
                }

                // Buraya ileride ekleme yapabilirsin: notlar, özel etiketler vs.
            }
            .padding()
        }
        .navigationTitle("Flört Detayı")
        .navigationBarTitleDisplayMode(.inline)
    }
}
