//
//  RoundedCorner.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 25.05.2025.
//

// RoundedCorner.swift
import SwiftUI

/// Sadece belirli köşeleri yuvarlamak için Shape
struct RoundedCorner: Shape {
    var radius: CGFloat = 16
    var corners: UIRectCorner = [.topRight, .bottomRight]
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
