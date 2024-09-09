//
//  HomeView.swift
//  AppModules
//
//  Created by Miguel Gonzalez on 9/4/24.
//

import SwiftUI
import SwiftData

public struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [TodoItem]
    @State private var showModal = false
    @State private var todoTitle = ""
    
    public init() {}
    
    public var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        VStack {
                            Text(item.title)
                                .font(.title)
                                .bold()
                            Text("Added on \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        }
                    } label: {
                        Text(item.title)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Todos")
            #if os(iOS)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        showModal.toggle()
                    } label: {
                        Label("Add Todo", systemImage: "plus")
                    }
                }
            }
            #endif
        } detail: {
            Text("Select an item")
        }
        .sheet(isPresented: $showModal) {
            if !todoTitle.isEmpty {
                addItem()
                todoTitle = ""
            }
        } content: {
            VStack {
                TextField("New Todo", text: $todoTitle)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 20)
                Button {
                    showModal.toggle()
                } label: {
                    Text("Add")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .presentationDetents([.height(200)])
            .presentationDragIndicator(.visible)
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = TodoItem(title: todoTitle)
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
