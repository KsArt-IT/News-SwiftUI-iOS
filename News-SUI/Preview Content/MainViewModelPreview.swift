//
//  MainViewModelPreview.swift
//  News-SUI
//
//  Created by KsArT on 16.11.2024.
//

import Foundation

final class MainViewModelPreview: Observable {
    static let shared = MainViewModel(repository: NewsRepositoryPreview())
}

private final class NewsRepositoryPreview: NewsRepository {
    func fetchTopNews(locale: String, language: String, page: Int) async -> Result<[NewsData], any Error> {
        .success(TopNewsPreview.news)
    }
    
    func fetchAllNews(locale: String, language: String, page: Int) async -> Result<[NewsData], any Error> {
        .success(AllNewsPreview.news)
    }
    
    func fetchNews(id: String) async -> Result<NewsData, any Error> {
        if let news = TopNewsPreview.news.first(where: { $0.id == id }) ??
            AllNewsPreview.news.first(where: { $0.id == id }) {
            .success(news)
        } else {
            .failure(NetworkError.cancelled)
        }
    }
}




