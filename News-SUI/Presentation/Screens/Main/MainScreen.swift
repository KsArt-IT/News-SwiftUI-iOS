//
//  MainScreen.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var viewModel: MainViewModel
    @Binding var selected: NewsData?
    
    var body: some View {
        ZStack {
            // ошибку или пустое поле
            VStack(spacing: 0) {
                // top news
                Text("Top News")
                TopNewsList(list: $viewModel.topNews, selected: $selected) {
                    viewModel.loadMoreTopNews()
                }
                .border(.blue)
                // all news
                Text("All News")
                AllNewsList(list: $viewModel.allNews, selected: $selected) {
                    viewModel.loadMoreAllNews()
                }
                .border(.yellow)
            }
            .border(.red)
            // loader
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
    }
}

#Preview {
    MainScreen(viewModel: MainViewModelPreview.shared, selected: .constant(nil))
}
