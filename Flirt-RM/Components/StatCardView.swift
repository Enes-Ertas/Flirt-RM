import SwiftUI

struct StatCardView: View {
    let value: String
    let subtitle: String
    // isFlexible: eğer true ise genişleyebilsin, yoksa sabit 150pt olsun
    var isFlexible: Bool = false

    var body: some View {
        VStack(spacing: 8) {
            Text(value)
                .font(.system(size: 36, weight: .semibold))
                .foregroundColor(.black)

            Text(subtitle)
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.black)
        }
        .frame(
            // flexible ise yatayda mümkün olduğunca yer kaplasın, değilse 150pt
            maxWidth: isFlexible ? .infinity : 150,
            // yükseklik her zaman 120pt
            minHeight: 120,
            maxHeight: 150
        )
        .background(Color.white)
        .cornerRadius(12)
    }
}
