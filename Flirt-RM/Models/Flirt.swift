
import Foundation

struct Flirt: Identifiable {
    let id = UUID()
    let name: String
    let gptProfile: String
    let lastContact: Date
}

let sampleFlirts = [
    Flirt(name: "Ayşe", gptProfile: "Romantic and thoughtful", lastContact: Date()),
    Flirt(name: "Berk", gptProfile: "Witty and energetic", lastContact: Date().addingTimeInterval(-86400))
]
