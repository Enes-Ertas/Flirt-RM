//
//  Item.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 23.05.2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
