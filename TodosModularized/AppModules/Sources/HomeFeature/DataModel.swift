//
//  DataModel.swift
//  AppModules
//
//  Created by Miguel Gonzalez on 9/5/24.
//

import SwiftData

public final class DataModel {
    public static var container: ModelContainer {
        let schema = Schema([
            TodoItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}
