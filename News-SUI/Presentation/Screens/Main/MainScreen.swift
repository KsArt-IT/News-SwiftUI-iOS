//
//  MainScreen.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import SwiftUI

struct MainScreen: View {
    @State private var news: [NewsData] = []
    private let repository: NewsRepository = NewsRepositoryImpl(service: NewsServiceImpl())
    
    var body: some View {
        ZStack {
            List {
                ForEach(news) { article in
                    Text(article.title)
                }
            }
            .listStyle(.plain)
        }
        .task {
            await getNews()
        }
    }
    
    private func getNews() async {
        print(#function)
        let language = String(localized: "language")
        let result = await repository.fetchTopNews(language: language, page: 1)
        switch result {
        case .success(let success):
            news = success
        case .failure(let error):
            if let error = error as? NetworkError {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    MainScreen()
}
