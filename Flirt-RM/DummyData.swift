
import Foundation

let sampleFlirts: [Flirt] = [
    Flirt(
        id: UUID(),
        name: "Ayşe",
        notes: "Kedileri sever, klasik müzik dinler",
        lastContact: Date(),
        gptProfileKey: "ayse_profile"
    ),
    Flirt(
        id: UUID(),
        name: "Berk",
        notes: "Espresso sever, siyasetle ilgilenir",
        lastContact: Date().addingTimeInterval(-86400 * 3),
        gptProfileKey: "berk_profile"
    )
]
