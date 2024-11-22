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
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Menu {
                            Section("Theme:") {
                                Button {
                                    appTheme = .device
                                } label: {
                                    Label(
                                        "Device",
                                        systemImage: appTheme == .device ? "checkmark.circle" : "circle"
                                    )
                                }
                                Button {
                                    appTheme = .light
                                } label: {
                                    Label(
                                        "Light",
                                        systemImage: appTheme == .light ? "checkmark.circle" : "circle"
                                    )
                                }
                                Button {
                                    appTheme = .dark
                                } label: {
                                    Label(
                                        "Dark",
                                        systemImage: appTheme == .dark ? "checkmark.circle" : "circle"
                                    )
                                }
                            }
                        } label: {
                            Label("Options", systemImage: "ellipsis.circle")
                        }
                    }
                }
        }
        .preferredColorScheme(appTheme.scheme)
        .task {
            if AppTheme.deviceTheme == nil {
                AppTheme.deviceTheme = colorScheme
                if appTheme == .device {
                    appTheme = colorScheme == .dark ? .dark : .light
                }
                print("ContentView: deviceTheme = \(colorScheme) appTheme = \(appTheme)")
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
