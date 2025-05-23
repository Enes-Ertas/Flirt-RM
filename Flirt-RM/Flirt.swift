
import Foundation

struct Flirt: Identifiable {
    let id: UUID
    var name: String
    var notes: String
    var lastContact: Date
    var gptProfileKey: String // ← bu isimle güncelle
}
