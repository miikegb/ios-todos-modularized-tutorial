//
//  TodosModularizedApp.swift
//  TodosModularized
//
//  Created by Miguel Gonzalez on 9/3/24.
//

import SwiftUI
import HomeFeature

@main
struct TodosModularizedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(DataModel.container)
    }
}
