import SwiftUI

struct StatCardView: View {
    let value: String
    let subtitle: String
    // isFlexible: eğer true ise genişleyebilsin, değilse sabit 150pt olsun
    var isFlexible: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(){
                Text(value)
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
            }

            Text(subtitle)
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.black)
        }                    // ← içerden bir miktar yatay boşluk
        .padding(.horizontal, 24)
        .frame(
            maxWidth: isFlexible ? .infinity : 150,  // flexible veya sabit genişlik
            minHeight: 120,
            maxHeight: 150
        )
        .background(Color.white)
        .cornerRadius(12)
    }
}
