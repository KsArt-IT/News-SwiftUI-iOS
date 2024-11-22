//
//  ContentView.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.diManager) private var di
    
    @State var selected: NewsData?
    @State private var isSelected = false
    
    @AppStorage("appTheme") private var appTheme = AppTheme.light
    
    var body: some View {
        NavigationStack {
            MainScreen(viewModel: di.resolve(), selected: $selected)
        }
        .preferredColorScheme(appTheme.scheme)
        .task {
            if AppTheme.deviceTheme == nil {
                print("ContentView: deviceTheme = \(colorScheme)")
                AppTheme.deviceTheme = colorScheme
            }
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
        .fullScreenCover(isPresented: $isSelected) {
            if let selected {
                NewsScreen(article: selected)
            }
        }
    }
}

#Preview {
    ContentView()
}
