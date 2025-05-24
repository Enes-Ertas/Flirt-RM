import SwiftUI

struct FlirtCardView: View {
    let name: String
    let summary: String
    let lastContact: String

    var body: some View {
        HStack {
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
            Spacer() // ❗️Sola doğru ittirir
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.fromHex("#e4cef2"))
        )
    }
}
