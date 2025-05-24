//
//  LoginView.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 23.05.2025.
//

import SwiftUI
import Supabase

let supabaseURL = URL(string: Bundle.main.infoDictionary?["SUPABASE_URL"] as? String ?? "")!
let supabaseKey = Bundle.main.infoDictionary?["SUPABASE_ANON_KEY"] as? String ?? ""

let supabase = SupabaseClient(supabaseURL: supabaseURL, supabaseKey: supabaseKey)


struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var isLoading = false
    @State private var navigateToMain = false


    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer()

                Image("phone") // AppIcon gibi soft illustration
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)

                Text("FlirtMate")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Manage your flirts effortlessly!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                VStack(spacing: 16) {
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)

                    if let error = errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
                    }

                    Button(action: handleEmailLogin) {
                        Text(isLoading ? "Signing in..." : "Sign in")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(12)
                    }
                    .disabled(isLoading)
                }
                .padding(.horizontal)

                HStack {
                    Rectangle().frame(height: 1).foregroundColor(.gray)
                    Text("or")
                        .foregroundColor(.gray)
                        .font(.caption)
                    Rectangle().frame(height: 1).foregroundColor(.gray)
                }
                .padding(.horizontal)

                Button(action: handleGoogleLogin) {
                    HStack(spacing: 8) {
                        Image("google")
                            .resizable()
                            .frame(width: 20, height: 20)

                        Text("Sign in with Google")
                            .fontWeight(.medium)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(12)
                }
                .padding(.horizontal)

                // MARK: - NavigationLink
                NavigationLink(destination: RegisterView()) {
                    Text("New to FlirtMate? Join now")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.bottom, 8)
                }

            }
            .padding([.horizontal, .top])
            .padding(.bottom, 40) // 👈 Keyboard çakışmasını engeller
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .navigationDestination(isPresented: $navigateToMain) {
            MainView()
        }.onOpenURL { url in
            if url.absoluteString.contains("login-callback") {
                navigateToMain = true
            }
        }

    }

    private func handleEmailLogin() {
        Task {
            isLoading = true
            do {
                try await supabase.auth.signIn(email: email, password: password)
                navigateToMain = true
                // TODO: View geçişi burada yapılabilir
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }

    private func handleGoogleLogin() {
        Task {
            do {
                try await supabase.auth.signInWithOAuth(
                    provider: .google,
                    redirectTo: URL(string: "com.enesertas.flirtrm.signin://login-callback")
                )
                navigateToMain = true
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }

    
}
