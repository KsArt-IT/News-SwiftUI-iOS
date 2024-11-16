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
        .failure(NetworkError.cancelled)
    }
}

private enum TopNewsPreview {
    static var news: [NewsData] = {
        var list: [NewsData] = []
        list.append(
            NewsData(
                id: "1",
                title: "Top News 1",
                description: "",
                keywords: "",
                snippet: "",
                url: "",
                image: nil,
                language: "",
                publishedAt: "",
                source: "",
                categories: [""],
                locale: "ua"
            )
        )
        list.append(
            NewsData(
                id: "2",
                title: "Top News 2",
                description: "",
                keywords: "",
                snippet: "",
                url: "",
                image: nil,
                language: "",
                publishedAt: "",
                source: "",
                categories: [""],
                locale: "ua"
            )
        )
        list.append(
            NewsData(
                id: "3",
                title: "Top News 3",
                description: "",
                keywords: "",
                snippet: "",
                url: "",
                image: nil,
                language: "",
                publishedAt: "",
                source: "",
                categories: [""],
                locale: "ua"
            )
        )
        return list
    }()
}

private enum AllNewsPreview {
    static var news: [NewsData] = {
        var list: [NewsData] = []
        list.append(
            NewsData(
                id: "1",
                title: "All News 1",
                description: "",
                keywords: "",
                snippet: "",
                url: "",
                image: nil,
                language: "",
                publishedAt: "",
                source: "",
                categories: [""],
                locale: "ua"
            )
        )
        list.append(
            NewsData(
                id: "2",
                title: "All News 2",
                description: "",
                keywords: "",
                snippet: "",
                url: "",
                image: nil,
                language: "",
                publishedAt: "",
                source: "",
                categories: [""],
                locale: "ua"
            )
        )
        list.append(
            NewsData(
                id: "3",
                title: "All News 3",
                description: "",
                keywords: "",
                snippet: "",
                url: "",
                image: nil,
                language: "",
                publishedAt: "",
                source: "",
                categories: [""],
                locale: "ua"
            )
        )
        return list
    }()
}
