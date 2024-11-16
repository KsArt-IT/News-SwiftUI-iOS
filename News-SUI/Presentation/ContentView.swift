//
//  ContentView.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.diManager) var di
    
    var body: some View {
        MainScreen(viewModel: di.resolve())
    }
}

#Preview {
    ContentView()
}
