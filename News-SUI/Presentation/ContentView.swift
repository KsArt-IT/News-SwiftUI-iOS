//
//  ContentView.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.diManager) var di
    @State var selected: NewsData? {
        didSet {
            isSelected = selected != nil
            print("selected: \(selected?.id ?? "")")
        }
    }
    @State var isSelected = false {
        didSet {
            if !isSelected {
                selected = nil
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            MainScreen(viewModel: di.resolve(), selected: $selected)
        }
        .sheet(isPresented: $isSelected) {
            if let selected {
                NewsView(article: selected)
                    .presentationDetents([.large, .medium])
            }
        }
    }
}

#Preview {
    ContentView()
}
