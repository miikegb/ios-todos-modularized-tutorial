//
//  Item.swift
//  TodosModularized
//
//  Created by Miguel Gonzalez on 9/3/24.
//

import Foundation
import SwiftData

@Model
public final class TodoItem {
    var title: String
    var timestamp: Date
    
    init(title: String, timestamp: Date = .now) {
        self.title = title
        self.timestamp = timestamp
    }
}
