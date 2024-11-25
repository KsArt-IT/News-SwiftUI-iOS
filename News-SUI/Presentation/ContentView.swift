//
//  ContentView.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import SwiftUI

struct ContentView: View {
    // получим тему на устройстве
    @Environment(\.colorScheme) private var colorScheme
    // сохраним-загрузим выбранную тему
    @AppStorage("appTheme") private var appTheme = AppTheme.device

    @Environment(\.diManager) private var di
    
    @State var selected: NewsData?
    @State private var isSelected = false
    
    var body: some View {
        NavigationStack {
            MainScreen(viewModel: di.resolve(), selected: $selected)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        ToolbarMenuView(appTheme: $appTheme)
                    }
                }
        }
        .background(.backgroundNews)
        .preferredColorScheme(appTheme.scheme(colorScheme))
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
