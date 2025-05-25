// AddFlirtView.swift
// Flirt-RM

import SwiftUI

struct AddFlirtView: View {
    @State private var selectedImage: UIImage?
    @State private var name: String = ""
    @State private var notes: String = ""
    @State private var conversation: String = ""
    @State private var isLoading = false
    @State private var errorMessage: String?
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer(minLength: 16)

                // — Profile photo picker placeholder —
                Button(action: {
                    // TODO: present image picker and assign to selectedImage
                }) {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                    } else {
                        ZStack {
                            Circle()
                                .fill(Color(.systemGray5))
                                .frame(width: 120, height: 120)
                            Image(systemName: "person.crop.circle.badge.plus")
                                .font(.system(size: 40, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                    }
                }
                .buttonStyle(.plain)

                // — Title & subtitle —
                Text("Add New Flirt")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Enter name, notes and last conversation to analyze")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // — Form fields —
                VStack(spacing: 16) {
                    TextField("Name", text: $name)
                        .textInputAutocapitalization(.words)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)

                    TextField("Notes (optional)", text: $notes)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)

                    TextEditor(text: $conversation)
                        .frame(height: 120)
                        .padding(4)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)

                    if let error = errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
                    }

                    Button(action: handleAnalyzeAndSave) {
                        Text(isLoading ? "Saving..." : "Analyze & Save")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(12)
                    }
                    .disabled(isLoading || name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding(.horizontal)

                Spacer(minLength: 32)
            }
            .padding()
        }
        .navigationTitle("Add New Flirt")
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil, from: nil, for: nil
            )
        }
        .background(Color(.systemBackground))
    }

    private func handleAnalyzeAndSave() {
        isLoading = true
        errorMessage = nil

        Task {
            do {
                // 1) Use GPT to analyze `conversation`
                // 2) Save name, notes, profile, image to your database
                // e.g.:
                // let profile = try await GPTClient.extractProfile(from: conversation)
                // try await Database.saveFlirt(name: name,
                //                              notes: notes,
                //                              profile: profile,
                //                              image: selectedImage)

                // On success, dismiss:
                dismiss()
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
