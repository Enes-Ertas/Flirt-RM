import SwiftUI

struct WelcomeView: View {
    @State private var navigateToLogin = false

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                VStack(spacing: 24) {
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

                    Text("Manage your flirts")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

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

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
        }
    }
}
