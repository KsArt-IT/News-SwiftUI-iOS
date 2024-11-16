//
//  MainScreen.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.topNews) { article in
                    Text(article.title)
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    MainScreen(viewModel: MainViewModelPreview.shared)
}
