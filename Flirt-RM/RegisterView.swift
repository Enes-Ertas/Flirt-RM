//
//  RegisterView.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 24.05.2025.
//

import SwiftUI
import Supabase

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var isLoading = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer()

                Image("phone")
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

                    Button(action: handleRegister) {
                        Text(isLoading ? "Registering..." : "Create Account")
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

                // Google ile kayıt opsiyonel, istersen buraya da eklenebilir

                Spacer()
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 40)
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }

    private func handleRegister() {
        Task {
            isLoading = true
            do {
                try await supabase.auth.signUp(email: email, password: password)
                // TODO: Kayıt sonrası yönlendirme yapılabilir
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
