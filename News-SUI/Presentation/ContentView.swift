//
//  ContentView.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.diManager) var di
    @State var selected: NewsData?
    @State var isSelected = false
    
    var body: some View {
        NavigationStack {
            MainScreen(viewModel: di.resolve(), selected: $selected)
        }
        .onChange(of: selected) {
            isSelected = selected != nil
            print("ContentView: selected = \(selected?.id ?? "nil")")
        }
        .onChange(of: isSelected) {
            if !isSelected && selected != nil {
                selected = nil
            }
        }
        .sheet(isPresented: $isSelected) {
            if let selected {
                NewsScreen(article: selected)
                    .presentationDetents([.large, .medium], selection: .constant(.large))
            }
        }
    }
}

#Preview {
    ContentView()
}
