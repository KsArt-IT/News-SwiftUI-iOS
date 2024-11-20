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
                    .padding(.bottom, Constants.small)
                NewsListHView(list: $viewModel.topNews, selected: $selected) {
                    viewModel.loadMoreTopNews()
//                    selected = TopNewsPreview.news[0]
                }
                .padding(.bottom, Constants.medium)
                // all news
                Text("All News")
                    .padding(.bottom, Constants.small)
                NewsListVView(list: $viewModel.allNews, selected: $selected) {
                    viewModel.loadMoreAllNews()
                }
                .padding(.bottom, Constants.small)
            }
            // loader
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .font(.title2)
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    MainScreen(viewModel: MainViewModelPreview.shared, selected: .constant(nil))
}
