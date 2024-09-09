//
//  ContentView.swift
//  TodosModularized
//
//  Created by Miguel Gonzalez on 9/3/24.
//

import SwiftUI
import LoginFeature
import HomeFeature

enum Screen {
    case login, home
}

struct ContentView: View {
    @State private var currentScreen = Screen.login
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            switch currentScreen {
            case .login:
                LoginView { @MainActor username, password in
                    Task {
                        isLoading = true
                        try await Task.sleep(nanoseconds: 2_000_000_000)
                        currentScreen = .home
                        isLoading = false
                    }
                }
            case .home:
                HomeView()
            }
            if isLoading {
                ProgressView {
                    Text("Loading")
                }
                .tint(.white)
                .foregroundStyle(.white)
                .progressViewStyle(.circular)
            }
        }
    }
}

#Preview {
    ContentView()
}
