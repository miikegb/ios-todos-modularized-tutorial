//
//  LoginView.swift
//  AppModules
//
//  Created by Miguel Gonzalez on 9/4/24.
//

import SwiftUI

public struct LoginView: View {
    var onSubmit: (String, String) -> Void
    @State private var username = ""
    @State private var password = ""
    @FocusState private var usernameIsFocused: Bool
    
    public init(onSubmit: @escaping (String, String) -> Void) {
        self.onSubmit = onSubmit
    }
    
    public var body: some View {
        ZStack {
            LinearGradient(colors: [.primary, .accentColor], startPoint: .top, endPoint: .bottom)
            VStack {
                VStack {
                    Spacer()
                    Text("Welcome")
                        .font(.system(size: 68))
                        .foregroundStyle(Color.accentColor)
                        .padding(.bottom, 100)
                }
                .frame(maxHeight: .infinity)
                
                VStack {
                    VStack {
                        InputTextView(input: $username, hint: "Username", systemImage: "person")
                            .padding(.bottom)
                        InputTextView(input: $password, hint: "Password", systemImage: "ellipsis.rectangle", isSecure: true)
                    }
                    .padding()
                    .foregroundStyle(.white)
                    
                    Button {
                        onSubmit(username, password)
                    } label: {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }
                .frame(maxHeight: .infinity)
            }
            .onAppear {
                usernameIsFocused = true
            }
        }
        .ignoresSafeArea(edges: .all)
    }
}

struct InputTextView: View {
    @Binding var input: String
    var hint: String
    var systemImage: String
    var isSecure = false
    
    private var textHint: some View {
        Text(hint)
            .foregroundStyle(Color(white: 0.8, opacity: 0.4))
    }

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: systemImage)
            if isSecure {
                SecureField(text: $input) {
                    textHint
                }
                .textContentType(.password)
            } else {
                TextField(text: $input) {
                    textHint
                }
                .textContentType(.emailAddress)
                #if os(iOS)
                .textInputAutocapitalization(.never)
                #endif
                .autocorrectionDisabled()
            }
        }
    }
}

#Preview {
    LoginView { username, password in
        print("Will attempt to login \(username) with passwod: \(password)")
    }
}
