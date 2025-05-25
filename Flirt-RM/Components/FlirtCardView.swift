import SwiftUI

struct FlirtCardView: View {
    let name: String
    let summary: String
    let lastContact: String

    var body: some View {
        HStack(spacing: 16) {
            // — Profil fotoğrafı ikonu (placeholder) —
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)

            // — Metinler —
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.title3)
                    .foregroundColor(.black)

                Text(summary)
                    .font(.body)
                    .foregroundColor(.black)

                Text("Last Contact: \(lastContact)")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        )
    }
}
