import SwiftUI

struct WelcomeView: View {
    @State private var navigateToLogin = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                Spacer()

                Image("flirt-illustration")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .cornerRadius(12)
                    .shadow(radius: 6)

                Text("FlirtMate")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 8)

                Text("Manage your flirts")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer()

                Button(action: {
                    navigateToLogin = true
                }) {
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 24)
            }
            .padding()
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
        }
    }
}
