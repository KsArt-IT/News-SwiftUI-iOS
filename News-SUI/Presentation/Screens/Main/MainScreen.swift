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
                NewsListHView(list: $viewModel.topNews, selected: $selected) {
                    if viewModel.topNewsState != .none {
                        ReloadingView(state: $viewModel.topNewsState) {
                            viewModel.loadMoreTopNews()
                        }
                        .frame(maxWidth: Constants.frameV, idealHeight: Constants.frameV)
                    }
                }
                .padding(.bottom, Constants.medium)
                // all news
                Text("All News")
                    .padding(.bottom, Constants.small)
                NewsListVView(list: $viewModel.allNews, selected: $selected) {
                    if viewModel.allNewsState != .none {
                        ReloadingView(state: $viewModel.allNewsState) {
                            viewModel.loadMoreAllNews()
                        }
                    }
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
        .navigationTitle("Top News")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MainScreen(viewModel: MainViewModelPreview.shared, selected: .constant(nil))
}
